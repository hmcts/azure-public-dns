#!/usr/bin/env bash



publicZoneResourceGroup=$1
publicZoneSubscription=$2
privateZoneResourceGroup=$3
privateZoneSubscription=$4
zones=$5

echo "filename: $filename"
echo "publicZoneResourceGroup: $publicZoneResourceGroup"
echo "publicZoneSubscription: $publicZoneSubscription"
echo "privateZoneResourceGroup: $privateZoneResourceGroup"
echo "privateZoneSubscription: $privateZoneSubscription"
echo "zones: $zones"


# Convert the input string to valid JSON
json_string=$(echo "$zones" | jq -c '.')

# Loop through each entry in the JSON
for entry in $(echo "$json_string" | jq -c '.[]'); do
    zoneName=$(echo "$entry" | jq -r '.dnsname')
    filename=$(echo "$entry" | jq -r '.filename')
    echo "zone Name: $zoneName, Filename: $filename"

    json_convert=$(yq eval -o=json "$filename")

    yaml_names=$(echo "$json_convert" | jq -c '.cname[]')

    # Retrieve CNAME records from public DNS zone
    publicRecords=$(az network dns record-set list --zone-name $zoneName -g $publicZoneResourceGroup --subscription $publicZoneSubscription --query "[?contains(type,'CNAME')].{Name:name, Type:type, TTL:ttl, CNAMERecord:CNAMERecord.cname}")

    privateZoneId=$(az network private-dns zone show -g $privateZoneResourceGroup -n $zoneName --query id -o tsv --subscription $privateZoneSubscription)

    # Retrieve existing CNAME records from private DNS zone
    existingPrivateRecords=$(az network private-dns record-set list --zone-name $zoneName -g $privateZoneResourceGroup --subscription $privateZoneSubscription --query "[?contains(type,'CNAME')].[name]" -o tsv)

    
            while IFS= read -r entry; do
                # Extract values from each entry
                recordName2=$(echo "$entry" | jq -r '.name')
                syncPrivateDNS=$(echo "$entry" | jq -r '.syncPrivateDNS')
                if [[ "$syncPrivateDNS" == "false" ]]; then
                    echo "recordName2 $recordName2";
                    recordPrivateDnsList+=("$recordName2")
                fi
                
            done <<< "$yaml_names"
    
    
    # Loop through public DNS records and create corresponding private DNS records if they don't exist



    for record in $(echo "$publicRecords" | jq -r '.[] | @base64'); do
        _jq() {
        echo ${record} | base64 --decode | jq -r ${1}
        }
        recordName=$(_jq '.Name')
        recordTTL=$(_jq '.TTL')
        recordValue=$(_jq '.CNAMERecord')

        ignore_record=false
        echo $recordValue

        for value in "${recordPrivateDnsList[@]}"
        do
            echo $value

            if echo "$existingPrivateRecords" | grep -q "$value"; then
                        az network private-dns record-set cname delete -g $privateZoneResourceGroup -z $zoneName  -n "$value" --subscription $privateZoneSubscription
                        echo "deleted $value from $zoneName zone as"
            fi
            if [[ $recordName == $value ]]; then
                    # echo "recordName $recordName";
                    # echo "value $value";
                    ignore_record=true
            fi
        done

        if ! echo "$existingPrivateRecords" | grep -q "$recordName" && ! $ignore_record; then
            # Create the record in private zone
            az network private-dns record-set cname create -g $privateZoneResourceGroup -z $zoneName  -n "$recordName" --subscription $privateZoneSubscription
            az network private-dns record-set cname set-record --record-set-name "$recordName" -g $privateZoneResourceGroup --zone-name $zoneName --cname $recordValue  --subscription $privateZoneSubscription
            echo "Created record $recordName in private zone."
        else
            echo "Record $recordName already exists in private zone. Skipping..."
        fi
    done

    ##### END OF LOOP #####
    
done