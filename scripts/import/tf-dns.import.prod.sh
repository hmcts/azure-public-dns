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
    # "DNS_ZONE")
    # dns_zone=${arr_config[1]}
    # ;;
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
done < tf-dns.import.prod.config

# Output ALL PROD zones into temp file
az network dns zone list -g $resource_group --subscription $az_subscription --query "[?starts_with(name,'platform') || starts_with(name,'reform') || starts_with(name,'track-benefit-appeal') || starts_with(name,'apply') || starts_with(name,'hearings') || starts_with(name, 'jcm') || starts_with(name,'money') || starts_with(name,'prod') || starts_with(name,'respond') || starts_with(name,'appeal') || starts_with(name,'divorce') || starts_with(name,'hmcts-access') || starts_with(name,'tm')].name" > prod_zone_list.pass-0.txt

# Clean this file
match_strings="[|]|\"|33m|39;49;00m|,"
IFS='|' read -ra arr_strings <<< "$match_strings"

# Set an array loop counter variable
counter=0

# Loop through the array of potential superflous strings to match
for match_string in "${arr_strings[@]}"
do
  while IFS="" read -r tmp_line || [ -n "$tmp_line" ]
  do
    echo ${tmp_line//$match_string}
    echo ${tmp_line//$match_string} >> prod_zone_list.pass-$counter.tmp
  done < prod_zone_list.pass-$counter.txt
  rm prod_zone_list.pass-$counter.txt
  # First, we increment the counter to name the next input file for inner file reading loop
  mv prod_zone_list.pass-$counter.tmp prod_zone_list.pass-$((counter+1)).txt
  # Then we increnent the counter to name the next temp file for inner file reading loop
  let counter=$counter+1
done

# Standardise the file name (remove loop counter from name)
mv prod_zone_list.pass-$counter.txt prod_zone_list.txt

if [ -e prod_zone_list.tmp ]
then
  rm prod_zone_list.tmp
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
    printf "$tmp_line\n" >> prod_zone_list.tmp
  fi
done < prod_zone_list.txt

# Swap temp file to main resource id file
rm prod_zone_list.txt
mv prod_zone_list.tmp prod_zone_list.txt

# Now, for each zone in "prod_zone_list.tmp", and import each of the records (resource IDs) from Azure
while IFS="" read -r dns_zone || [ -n "$dns_zone" ]
do
    az network dns record-set list -g $resource_group -z $dns_zone  --subscription $az_subscription --query [].id -o tsv > $dns_zone-resource-ids.pass-0.txt

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
        # Identified blank line; literally do nothing!
        sleep 0
      else
        printf "$tmp_line\n" >> $dns_zone-resource-ids.tmp
      fi
    done < $dns_zone-resource-ids.txt

    # Swap temp file to main resource id file
    rm $dns_zone-resource-ids.txt
    mv $dns_zone-resource-ids.tmp $dns_zone-resource-ids.txt

    ### Create Azure dns resource placeholder *.tf file
    # grep -oh "/A\|/AAA\|/NS\|/CNAME\|/MX\|/TXT\|/PTR" $dns_zone-resource-ids.txt | sort | uniq -c | sort -n > group_sort_records.tmp

    ### Create •.tfvars file
    # sh ./tf-dns.tfvarsgenerator.prod.sh

    ### Import zone and recordsets from Azure Public DNS
    # Read from $zone_entry-resource-ids.txt and build a dns record importer script
    while IFS="" read -r tmp_line || [ -n "$tmp_line" ]
    do
      # What type of record is this?\
      record_type=${echo "$tmp_line | grep  -oh '/A\|/AAA\|/NS\|/CNAME\|/MX\|/TXT\|/PTR'"}
      case "$record_type" in
        "/A")
        record_type="a"
        ;;
        "/AAA")
        record_type="aaa"
        ;;
        "/NS")
        record_type="ns"
        ;;
        "/CNAME")
        record_type="cname"
        ;;
        "/MX")
        record_type="mx"
        ;;
        "/TXT")
        record_type="txt"
        ;;
        "/PTR")
        record_type="ptr"
        ;;
      esac

      # echo "terraform import -var resource_group_name=$resource_group $tmp_line" > tf-dns.$dns_zone.recordimporter.prod.sh
      echo "terraform import -var resource_group_name=$resource_group azurerm_dns_"$record_type"_record $tmp_line" >> tf-dns.$dns_zone.recordimporter.prod.sh 
    done < $dns_zone-resource-ids.txt

    # current_dir=$PWD
    # cd ../../components/sandbox
    # sh ./tf-dns.recordimporter.sh $resource_group
    # cd $current_dir

    ### Run Terraform plan
    # Switch to '../../components/<env>' directory
    # terraform init
    # terraform fmt
    # terraform plan -var-file='../../environments/prod/$dns_zone.tfvars'
done < prod_zone_list.txt