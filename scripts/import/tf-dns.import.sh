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

### Create dummy TF configuration file
# Run py-az2tf (Azure to Terraform import prep util)
# sh ../prep/py-az2tf/az2tf.sh -s ed302caf-ec27-4c64-a05e-85731c3ce90e -g $resource_group -r azurerm_dns_zone

# Merge generated dummy records into single file


# Cleanup py-az2tf generated files directory

### Create Azure dns resource placeholder *.tf file


### Create •.tfvars file
grep -ioh "/A\|/AAA\|/NS\|/CNAME\|/MX\|/TXT\|/PTR" $dns_zone-resource-ids.txt | sort | uniq -c | sort -n > group_sort_records.tmp


### Import zone and recordsets from Azure Public DNS
echo "Terraform import started!"
line=$(sed '1q;d' ithc.platform.hmcts.net-resource-ids.txt) && terraform import -var 'env=ithc' -var 'ithc-platform-hmcts-net=ithc.platform.hmcts.net'  -var 'resource_group_name=reformmgmtrg' -backup=terraform.local.tfstate.backup module.public-dns.azurerm_dns_zone.$dns_zone $line
c=0 && line=$(sed '2q;d' ithc.platform.hmcts.net-resource-ids.txt) && terraform import -var 'env=ithc' -var 'ithc-platform-hmcts-net=ithc.platform.hmcts.net'  -var 'resource_group_name=reformmgmtrg' -backup=terraform.local.tfstate.backup module.public-dns.azurerm_dns_ns_record."this[0]" $line
echo "Terraform import completed!"

### Run Terraform plan
# Switch to '../../components/<env>' directory
# terraform init
# terraform fmt
# terraform plan -var-file='../../environments/$env.tfvars'

