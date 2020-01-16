cd -P -- "$(dirname -- "$0")" || exit

### Read import config file and poulate config lines into array then
###ß extract config values from array
while IFS="" read -r param_line || [ -n "$param_line" ]
do
  IFS='=' read -ra arr_config <<< "$param_line"
  which_param=${arr_config[0]}
  case "$which_param" in
    "RESOURCE_GROUP")
    resource_group=${arr_config[1]}
    ;;
    "DNS_ZONE")
    dns_zone=${arr_config[1]}
    ;;
    "AZ_SUBSCRIPTION")
    az_subscription=${arr_config[1]}
    ;;
    "ENVIRONMENT")
    env=${arr_config[1]}
    ;;
    # "MATCH_STRINGS")
    # match_strings="${arr_config[1]}"
    # ;;
  esac
done < tf-dns.import.config

# Output zone into temp file
az network dns record-set list -g $resource_group -z $dns_zone --subscription $az_subscription > _jsoninput.pass-0.json

# Clean this file
match_strings="[94m|[39;49;00m|[34m|[33m|"
IFS='|' read -ra arr_strings <<< "$match_strings"

# Set an array loop counter variable
counter=0

# Count the number of elements in the json input file to check for end of iteration later
jq_item_count=$(jq length _jsoninput.json)
jq_item_counter=0

# Loop through the array of potential superflous strings to match
for match_string in "${arr_strings[@]}"
do
  while IFS="" read -r tmp_line || [ -n "$tmp_line" ]
  do
    # echo ${tmp_line//$match_string}
    echo ${tmp_line//$match_string} >> _jsoncleaner.pass-$counter.tmp
  done < _jsoninput.pass-$counter.json
  rm _jsoninput.pass-$counter.json
  # First, we increment the counter to name the next input file for inner file reading loop
  mv _jsoncleaner.pass-$counter.tmp _jsoninput.pass-$((counter+1)).json
  # Then we increnent the counter to name the next temp file for inner file reading loop
  let counter=$counter+1
done

# Standardise the file name (remove loop counter from name)
mv _jsoninput.pass-$counter.json _jsoninput.json

if [ -e _jsoncleaner.tmp ]
then
  rm _jsoncleaner.tmp
fi

# Create a write into <env>.tfvars
if [ -e $env.tfvars ]
then
  rm $env.tfvars
fi
echo "recordsets = [" > $env.tfvars

# Iterate this file and buile the <env>.tfvars file
jq -c '.[]' _jsoninput.json | while read i; do
     # Update json iteration on elements (determine where closing braces have a comma added prior to next json element)
    let jq_item_counter=$jq_item_counter+1
    if (( $jq_item_counter < $jq_item_count )); then close_item="},"; else close_item="}"; fi
    json_line=$i
    jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_line" | \
    while IFS='|' read key value; do
        key_name=$key
        key_value=$value
        which_key=$key_name
        case "$which_key" in
            "aaaaRecords")
            if [ $value != null ];
            then
                # Enumerate and collate AAAA record(s)
                name=$(jq '(.name)' <<<"$json_line")
                json_record=$(jq '(.aaaaRecords)' <<<"$json_line")
                jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_record" | \
                while IFS='|' read -r rKey rValue; do
                    records=$rValue
                    echo $records >> tmpResult.tmp
                done
                records='"'$(cat tmpResult.tmp)'"'
                rm tmpResult.tmp
                ttl=$(jq '(.ttl)' <<<"$json_line")
                type='"'AAAA'"'
                # Write out to <env>.tfvars file
                echo "{" \
                "name = "$name"," \
                "records = ["$records"]," \
                "ttl = "$ttl"," \
                "type = "$type \
                ${close_item} >> $env.tfvars
                
            fi
            ;;
            "arecords")
            if [ $value != null ];
            then
                # Enumerate and collate A record(s)
                name=$(jq '(.name)' <<<"$json_line")
                json_record="$(jq '(.arecords)' <<<"$json_line")"
                # Remove open/close square brackets first
                json_record="$(jq '.[]' <<<"$json_record")"
                jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_record" | \
                while IFS='|' read -r rKey rValue; do
                    records=$rValue
                    echo $records >> tmpResult.tmp
                done
                records='"'$(cat tmpResult.tmp)'"'
                rm tmpResult.tmp
                ttl=$(jq '(.ttl)' <<<"$json_line")
                type='"'A'"'
                # Write out to <env>.tfvars file
                echo "{" \
                "name = "$name"," \
                "records = ["$records"]," \
                "ttl = "$ttl"," \
                "type = "$type \
                $close_item >> $env.tfvars
            fi
            ;;
            "caaRecords")   
            if [ $value != null ];
            then   
                # Enumerate and collate CAA record(s)
                name=$(jq '(.name)' <<<"$json_line")
                json_record=$(jq '(.caaRecords)' <<<"$json_line")
                jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_record" | \
                while IFS='|' read -r rKey rValue; do
                    records=$rValue
                    echo $records >> tmpResult.tmp
                done
                records='"'$(cat tmpResult.tmp)'"'
                rm tmpResult.tmp
                ttl=$(jq '(.ttl)' <<<"$json_line")
                type='"'CAA'"'
                # Write out to <env>.tfvars file
                echo "{" \
                "name = "$name"," \
                "records = ["$records"]," \
                "ttl = "$ttl"," \
                "type = "$type \
                $close_item >> $env.tfvars
            fi
            ;;
            "cnameRecord")
            if [ $value != null ];
            then
                # Enumerate and collate CNAME record(s)
                name=$(jq '(.name)' <<<"$json_line")
                json_record=$(jq '(.cnameRecord)' <<<"$json_line")
                jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_record" | \
                while IFS='|' read -r rKey rValue; do
                    records=$rValue
                    echo $records >> tmpResult.tmp
                done
                records='"'$(cat tmpResult.tmp)'"'
                rm tmpResult.tmp
                ttl=$(jq '(.ttl)' <<<"$json_line")
                type='"'CNAME'"'
                # Write out to <env>.tfvars file
                echo "{" \
                "name = "$name"," \
                "records = ["$records"]," \
                "ttl = "$ttl"," \
                "type = "$type \
                $close_item >> $env.tfvars
            fi
            ;;
            "mxRecords")
            if [ $value != null ];
            then
                # Enumerate and collate MX record(s)
                name=$(jq '(.name)' <<<"$json_line")
                json_record=$(jq '(.mxRecords)' <<<"$json_line")
                json_record="$(jq '.[]' <<<"$json_record")"
                jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_record" | \
                while IFS='|' read -r rKey rValue; do
                    records=$rValue
                    echo $records >> tmpResult.tmp
                done
                records='"'$(cat tmpResult.tmp)'"'
                rm tmpResult.tmp
                ttl=$(jq '(.ttl)' <<<"$json_line")
                type='"'MX'"'
                # Write out to <env>.tfvars file
                echo "{" \
                "name = "$name"," \
                "records = ["$records"]," \
                "ttl = "$ttl"," \
                "type = "$type \
                $close_item >> $env.tfvars
            fi
            ;;
            "nsRecords")
            if [ $value != null ];
            then
                # Enumerate and collate NS record(s)
                name=$(jq '(.name)' <<<"$json_line")
                json_record=$(jq '(.nsRecords)' <<<"$json_line")
                # Remove open/close square brackets first
                json_record="$(jq '.[]' <<<"$json_record")"
                jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_record" | \
                while IFS='|' read -r rKey rValue; do
                    records='"'$rValue'",'
                    echo $records >> tmpResult.tmp
                done
                records=$(cat tmpResult.tmp)
                rm tmpResult.tmp
                ttl=$(jq '(.ttl)' <<<"$json_line")
                type='"'NS'"'
                # Write out to <env>.tfvars file
                echo "{" \
                "name = "$name"," \
                "records = [$records]", \
                "ttl = "$ttl"," \
                "type = "$type \
                $close_item >> $env.tfvars
            fi
            ;;
            "ptrRecords")
            if [ $value != null ];
            then
                # Enumerate and collate PTR record(s)
                name=$(jq '(.name)' <<<"$json_line")
                json_record=$(jq '(.ptrRecords)' <<<"$json_line")
                jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_record" | \
                while IFS='|' read -r rKey rValue; do
                    records=$rValue
                    echo $records >> tmpResult.tmp
                done
                records='"'$(cat tmpResult.tmp)'"'
                rm tmpResult.tmp
                ttl=$(jq '(.ttl)' <<<"$json_line")
                type='"'PTR'"'
                # Write out to <env>.tfvars file
                echo "{" \
                "name = "$name"," \
                "records = ["$records"]," \
                "ttl = "$ttl"," \
                "type = "$type \
                $close_item >> $env.tfvars
            fi
            ;;
            "srvRecords")
            if [ $value != null ];
            then
                # Enumerate and collate SRV record(s)
                name=$(jq '(.name)' <<<"$json_line")
                json_record=$(jq '(.srvRecords)' <<<"$json_line")
                jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_record" | \
                while IFS='|' read -r rKey rValue; do
                    records=$rValue
                    echo $records >> tmpResult.tmp
                done
                records='"'$(cat tmpResult.tmp)'"'
                rm tmpResult.tmp
                ttl=$(jq '(.ttl)' <<<"$json_line")
                type='"'SRV'"'
                # Write out to <env>.tfvars file
                echo "{" \
                "name = "$name"," \
                "records = ["$records"]," \
                "ttl = "$ttl"," \
                "type = "$type \
                $close_item >> $env.tfvars
            fi
            ;;
            "txtRecords")
            if [ "$value" != null ];
            then
                # Enumerate and collate TXT record(s)
                name=$(jq '(.name)' <<<"$json_line")
                json_record=$(jq '(.txtRecords[])' <<<"$json_line")
                jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_record" | \
                while IFS='|' read -r rKey rValue; do
                    records=$rValue
                    echo $records >> tmpResult.tmp
                done
                records=$(cat tmpResult.tmp)
                rm tmpResult.tmp
                ttl=$(jq '(.ttl)' <<<"$json_line")
                type='"'TXT'"'
                # Write out to <env>.tfvars file
                echo "{" \
                "name = "$name"," \
                "records = $records," \
                "ttl = "$ttl"," \
                "type = "$type \
                $close_item >> $env.tfvars
            fi
            ;;
            ### Currently unsupported by Azure resource manager
            # "soaRecord")
            # if [ $value != null ];
            # then
            #     # Enumerate and collate SOA record(s)
            #     name=$(jq '(.name)' <<<"$json_line")
            #     json_record=$(jq '(.soaRecord)' <<<"$json_line")
            #     jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_record" | \
            #     while IFS='|' read -r rKey rValue; do
            #         records=$rValue
            #         echo $records >> tmpResult.tmp
            #     done
            #     records='"'$(cat tmpResult.tmp)'"'
            #     rm tmpResult.tmp
            #     ttl=$(jq '(.ttl)' <<<"$json_line")
            #     type='"'SOA'"'
            #     # Write out to <env>.tfvars file
            #     echo "{" \
            #     "name = "$name"," \
            #     "records = ["$records"]," \
            #     "ttl = "$ttl"," \
            #     "type = "$type \
            #     $close_item >> $env.tfvars
            # fi
            # ;;
        esac
    done
done

# Create a write into <env>.tfvars
echo "]" >> $env.tfvars

# Pretty print the <env>.tfvars file
# jq . $env.tfvars

# Copy to the environment directory
cp $env.tfvars ../../environments