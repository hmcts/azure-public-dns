# Output zone into temp file
az network dns record-set list -g reformmgmtrg -z sandbox.platform.hmcts.net --subscription Reform-CFT-Mgmt > _jsoninput.pass-0.json

# Clean this file
match_strings="[94m|[39;49;00m|[34m|[33m|"
IFS='|' read -ra arr_strings <<< "$match_strings"

# Set an array loop counter variable
counter=0

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

# Iterate this file and buile the <env>.tfvars file
jq -c '.[]' _jsoninput.json | while read i; do
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
                echo "{"
                echo "name = "$name","
                echo "records = ["$records"],"
                echo "ttl = "$ttl","
                echo "type = "$type
                echo "}"
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
                echo "{"
                echo "name = "$name","
                echo "records = ["$records"],"
                echo "ttl = "$ttl","
                echo "type = "$type
                echo "}"
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
                echo "{"
               echo "name = "$name","
                echo "records = ["$records"],"
                echo "ttl = "$ttl","
                echo "type = "$type
                echo "}"
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
                echo "{"
                echo "name = "$name","
                echo "records = ["$records"],"
                echo "ttl = "$ttl","
                echo "type = "$type
                echo "}"
            fi
            ;;
            "mxRecords")
            if [ $value != null ];
            then
                # Enumerate and collate MX record(s)
                name=$(jq '(.name)' <<<"$json_line")
                json_record=$(jq '(.mxRecords)' <<<"$json_line")
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
                echo "{"
                echo "name = "$name","
                echo "records = ["$records"],"
                echo "ttl = "$ttl","
                echo "type = "$type
                echo "}"
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
                echo "{"
                echo "name = "$name","
                echo "records = [$records],"
                echo "ttl = "$ttl","
                echo "type = "$type
                echo "}"
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
                echo "{"
                echo "name = "$name","
                echo "records = ["$records"],"
                echo "ttl = "$ttl","
                echo "type = "$type
                echo "}"
            fi
            ;;
            "soaRecord")
            if [ $value != null ];
            then
                # Enumerate and collate SOA record(s)
                name=$(jq '(.name)' <<<"$json_line")
                json_record=$(jq '(.soaRecord)' <<<"$json_line")
                jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_record" | \
                while IFS='|' read -r rKey rValue; do
                    records=$rValue
                    echo $records >> tmpResult.tmp
                done
                records='"'$(cat tmpResult.tmp)'"'
                rm tmpResult.tmp
                ttl=$(jq '(.ttl)' <<<"$json_line")
                type='"'SOA'"'
                # Write out to <env>.tfvars file
                echo "{"
                echo "name = "$name","
                echo "records = ["$records"],"
                echo "ttl = "$ttl","
                echo "type = "$type
                echo "}"
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
                echo "{"
                echo "name = "$name","
                echo "records = ["$records"],"
                echo "ttl = "$ttl","
                echo "type = "$type
                echo "}"
            fi
            ;;
            "txtRecords")
            if [ $value != null ];
            then
                # Enumerate and collate TXT record(s)
                name=$(jq '(.name)' <<<"$json_line")
                json_record=$(jq '(.txtRecords)' <<<"$json_line")
                jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' <<<"$json_record" | \
                while IFS='|' read -r rKey rValue; do
                    records=$rValue
                    echo $records >> tmpResult.tmp
                done
                records='"'$(cat tmpResult.tmp)'"'
                rm tmpResult.tmp
                ttl=$(jq '(.ttl)' <<<"$json_line")
                type='"'TXT'"'
                # Write out to <env>.tfvars file
                echo "{"
                echo "name = "$name","
                echo "records = ["$records"],"
                echo "ttl = "$ttl","
                echo "type = "$type
                echo "}"
            fi
            ;;
        esac
    done
done