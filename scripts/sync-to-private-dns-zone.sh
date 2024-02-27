#!/usr/bin/env bash

# Variables
zoneName="sandbox.platform.hmcts.net"
filename=$1
publicZoneResourceGroup=$2 #"reformmgmtrg"
publicZoneSubscription=$3 #"Reform-CFT-Mgmt"
privateZoneResourceGroup=$4 #"core-infra-intsvc-rg"
privateZoneSubscription=$5 #"DTS-CFTSBOX-INTSVC"

echo "filename: $filename"
echo "publicZoneResourceGroup: $publicZoneResourceGroup"
echo "publicZoneSubscription: $publicZoneSubscription"
echo "privateZoneResourceGroup: $privateZoneResourceGroup"
echo "privateZoneSubscription: $privateZoneSubscription"
echo "zones: $6"

for zone in "${@:6}"; do
    # Process each zone
    echo "Processing zone: $zone"
done

# Retrieve CNAME records from public DNS zone
publicRecords=$(az network dns record-set list --zone-name $zoneName -g $publicZoneResourceGroup --subscription $publicZoneSubscription --query "[?contains(type,'CNAME')].{Name:name, Type:type, TTL:ttl, CNAMERecord:CNAMERecord.cname}")

privateZoneId=$(az network private-dns zone show -g $privateZoneResourceGroup -n $zoneName --query id -o tsv --subscription $privateZoneSubscription)

# Retrieve existing CNAME records from private DNS zone
existingPrivateRecords=$(az network private-dns record-set list --zone-name $zoneName -g $privateZoneResourceGroup --subscription $privateZoneSubscription --query "[?contains(type,'CNAME')].[name]" -o tsv)

# Loop through public DNS records and create corresponding private DNS records if they don't exist
for record in $(echo "$publicRecords" | jq -r '.[] | @base64'); do
    _jq() {
     echo ${record} | base64 --decode | jq -r ${1}
    }
    recordName=$(_jq '.Name')
    recordTTL=$(_jq '.TTL')
    recordValue=$(_jq '.CNAMERecord')
    echo $recordValue

    # Check if the record already exists in private zone
    # if ! az network private-dns record-set cname list --zone-name $zoneName -g $privateZoneResourceGroup --subscription $privateZoneSubscription --query "[?name=='$recordName'].name" | grep -q "$recordName"; then
    if ! echo "$existingPrivateRecords" | grep -q "$recordName"; then
        # Create the record in private zone
        az network private-dns record-set cname create -g $privateZoneResourceGroup -z $zoneName  -n "$recordName" --subscription $privateZoneSubscription
        az network private-dns record-set cname set-record --record-set-name "$recordName" -g $privateZoneResourceGroup --zone-name $zoneName --cname $recordValue  --subscription $privateZoneSubscription
        echo "Created record $recordName in private zone."
    else
        echo "Record $recordName already exists in private zone. Skipping..."
    fi
done
