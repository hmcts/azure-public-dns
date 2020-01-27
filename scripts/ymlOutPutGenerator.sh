#!/bin/bash

echo "YAML generation task started....!"

echo "Enter the Zone name to generate yaml content:"
read ZONENAME

echo "Enter the recordset type:"
read TYPE

rm -rf $ZONENAME-*.yml
rm -rf $ZONENAME-*.json

az network dns record-set $TYPE list --resource-group reformmgmtrg --zone-name $ZONENAME >> "$ZONENAME-$TYPE.json"

echo "Records exported .....successfuly....."

count=`jq '. | length' $ZONENAME-$TYPE.json`

echo "RecordCount = $count"

echo -e "$TYPE:" >> $ZONENAME-$TYPE.yml

case "$TYPE" in
  #case 1
  "A") 
    for ((c=0; c<$count; c++))
    do
      echo "  - name: `cat $ZONENAME-$TYPE.json | jq --argjson i $c '.[$i].name'`" >> $ZONENAME-$TYPE.yml
      echo "    ttl: `cat $ZONENAME-$TYPE.json | jq --argjson i $c '.[$i].ttl'`" >> $ZONENAME-$TYPE.yml
      echo "    record: " >> $ZONENAME-$TYPE.yml
      echo "      - `cat $ZONENAME-$TYPE.json | jq --argjson i $c '.[$i].arecords[0].ipv4Address'`" >> $ZONENAME-$TYPE.yml
    done
  ;;
  #case 2
  "cname")
    for ((c=0; c<$count; c++))
    do
      echo "  - name: `cat $ZONENAME-$TYPE.json | jq --argjson i $c '.[$i].name'`" >> $ZONENAME-$TYPE.yml
      echo "    ttl: `cat $ZONENAME-$TYPE.json | jq --argjson i $c '.[$i].ttl'`" >> $ZONENAME-$TYPE.yml
      echo "    record: `cat $ZONENAME-$TYPE.json | jq --argjson i $c '.[$i].cnameRecord.cname'`" >> $ZONENAME-$TYPE.yml
    done
  ;;
  #case 3
  "ns")
    for ((c=0; c<$count; c++))
    do
      echo "  - name: `cat $ZONENAME-$TYPE.json | jq --argjson i $c '.[$i].name'`" >> $ZONENAME-$TYPE.yml
      echo "    ttl: `cat $ZONENAME-$TYPE.json | jq --argjson i $c '.[$i].ttl'`" >> $ZONENAME-$TYPE.yml
      echo "    record: " >> $ZONENAME-$TYPE.yml
      echo "      - `cat $ZONENAME-$TYPE.json | jq --argjson i $c '.[$i].nsRecords[0].nsdname'`" >> $ZONENAME-$TYPE.yml
      echo "      - `cat $ZONENAME-$TYPE.json | jq --argjson i $c '.[$i].nsRecords[1].nsdname'`" >> $ZONENAME-$TYPE.yml
      echo "      - `cat $ZONENAME-$TYPE.json | jq --argjson i $c '.[$i].nsRecords[2].nsdname'`" >> $ZONENAME-$TYPE.yml
      echo "      - `cat $ZONENAME-$TYPE.json | jq --argjson i $c '.[$i].nsRecords[3].nsdname'`" >> $ZONENAME-$TYPE.yml
    done
esac

echo "yaml generated successfuly......."