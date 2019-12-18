#!/bin/bash

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

# Now import the zone records from Azure
az network dns record-set list -g $resource_group -z $dns_zone --subscription $az_subscription --query [].id -o tsv > ./$dns_zone-resource-ids.pass-0.txt

### Remove superflous characters from the dns resource id list; create array of superflous characters to match, separated
### by the "|" character
match_strings="[94m\"id\"[39;49;00m: [33m|[94m\"id\"[39;49;00m: [33m|[94m\"id\"[39;49;00m: [34mnull[39;49;00m|[39;49;00m,|\""
IFS='|' read -ra arr_strings <<< "$match_strings"

# Set an array loop counter variable
counter=0

# Loop through the array of potential superflous strings to match
for match_string in "${arr_strings[@]}"
do
  while IFS="" read -r tmp_line || [ -n "$tmp_line" ]
  do
    echo ${tmp_line//$match_string}
    echo ${tmp_line//$match_string} >> $dns_zone-resource-ids.pass-$counter.tmp
  done < $dns_zone-resource-ids.pass-$counter.txt
  rm $dns_zone-resource-ids.pass-$counter.txt
  # First, we increment the counter to name the next input file for inner file reading loop
  mv $dns_zone-resource-ids.pass-$counter.tmp $dns_zone-resource-ids.pass-$((counter+1)).txt
  # Then we increnent the counter to name the next temp file for inner file reading loop
  let counter=$counter+1
done

# Standardise the file name (remove loop counter from name)
mv $dns_zone-resource-ids.pass-$counter.txt $dns_zone-resource-ids.txt

if [ -e $dns_zone-resource-ids.tmp ]
then
  rm $dns_zone-resource-ids.tmp
fi

### Find and omit blank lines
while IFS="" read -r tmp_line || [ -n "$tmp_line" ]
do
  stringlen=$(echo $tmp_line | awk '{print length}')
  if [ $stringlen -le 1 ]
  then
    # Identidied blank line; literally do nothing!
    sleep 0
  else
    printf "$tmp_line\n" >> $dns_zone-resource-ids.tmp
  fi
done < $dns_zone-resource-ids.txt

# Swap temp file to main resource id file
rm $dns_zone-resource-ids.txt
mv $dns_zone-resource-ids.tmp $dns_zone-resource-ids.txt

# Remove the SOA record from the list of resource IDs (delete line where the record exists)
awk '!/SOA\/@/' $dns_zone-resource-ids.txt > $dns_zone-resource-ids.txt.tmp && mv $dns_zone-resource-ids.txt.tmp $dns_zone-resource-ids.txt

### Create •.tfvars file
echo
echo "Please wait while the $env.tfvars file is generated..."
sh ./tf-dns.tfvarsgenerator.sh &&

### Import zone and recordsets from Azure Public DNS
# Read from $dns_zone-resource-ids.txt and build a dns record importer script

# Delete the  dns record importer if it already exists
if [ -e tf-dns.recordimporter.sh ]
then
  rm tf-dns.recordimporter.sh
fi

# First import the dns zone
zone_record_id=$(az network dns zone list -g $resource_group --subscription $az_subscription --query [].id -o tsv | grep $dns_zone)
echo "terraform import -var resource_group_name=$resource_group azurerm_dns_zone.zone $zone_record_id" > tf-dns.recordimporter.sh

# What type of dns records are we processing?
grep -oh "A\|AAA\|NS\|CNAME\|MX\|TXT\|PTR" $dns_zone-resource-ids.txt > group_sort_records.tmp

# Iterate the dns recordset IDs, determine record type and write into an import bash script file to be utilised in the next step
# Initialise arrays to hold dns record types
A=0; AAAA=0; NS=0; CNAME=0; MX=0; TXT=0; PTR=0

while IFS= read -r -u 4 line1 && IFS= read -r -u 5 line2; do
  record_type=$line2
  case "$record_type" in
    "A")
     echo terraform import -var resource_group_name=$resource_group module.public-dns.azurerm_dns_a_record."this[$A]" $line1 >> tf-dns.recordimporter.sh
     let A=$A+1
    ;;
    "AAAA")
     echo terraform import -var resource_group_name=$resource_group module.public-dns.azurerm_dns_aaaa_record."this[$AAAA]" $line1 >> tf-dns.recordimporter.sh
     let AAAA=$AAAA+1
    ;;
    "NS")
     echo terraform import -var resource_group_name=$resource_group module.public-dns.azurerm_dns_ns_record."this[$NS]" $line1 >> tf-dns.recordimporter.sh
     let NS=$NS+1
    ;;
    "CNAME")
     echo terraform import -var resource_group_name=$resource_group module.public-dns.azurerm_dns_cname_record."this[$CNAME]" $line1 >> tf-dns.recordimporter.sh
     let CNAME=$CNAME+1
    ;;
    "MX")
     echo terraform import -var resource_group_name=$resource_group module.public-dns.azurerm_dns_mx_record."this[$MX]" $line1 >> tf-dns.recordimporter.sh
     let MX=$MX+1
    ;;
    "TXT")
     echo terraform import -var resource_group_name=$resource_group module.public-dns.azurerm_dns_txt_record."this[$TXT]" $line1 >> tf-dns.recordimporter.sh
     let TXT=$TXT+1
    ;;
    "PTR")
     echo terraform import -var resource_group_name=$resource_group module.public-dns.azurerm_dns_ptr_record."this[$PTR]" $line1 >> tf-dns.recordimporter.sh
     let PTR=$PTR+1
    ;;
  esac
done 4<$dns_zone-resource-ids.txt 5<group_sort_records.tmp

# Copy the generated script into the relevant env directory
cp tf-dns.recordimporter.sh ../../components/$env

# Remove temp files we no longer need
rm group_sort_records.tmp
# rm tf-dns.recordimporter.sh  # As is temp import script copied to ../../components/<env>
rm $dns_zone-resource-ids.txt
# rm tf-dns.recordimporter.sh

# current_dir=$PWD
# cd ../../components/sandbox;special
# sh ./tf-dns.recordimporter.sh $resource_group
# cd $current_dir

### Run Terraform plan
# Switch to '../../components/<env>' directory
# terraform init
# terraform fmt
# terraform plan -var-file='../../environments/$env.tfvars'

