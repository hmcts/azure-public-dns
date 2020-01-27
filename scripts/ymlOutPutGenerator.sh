#!/bin/bash

echo "YAML generation task started....!"

echo "Enter the Zone name to generate yaml content:"
read ZONENAME

zone=`az network dns zone show -g reformmgmtrg -n ${ZONENAME} | jq '.name'`

if [ -z "${zone}" ]
then
  echo "Zone enterred ${zone} not found."
  exit 1
fi

rm -rf $ZONENAME.yml
rm -rf $ZONENAME-*.json

echo "Retrieving A, NS and CNAME recordsets for ${ZONENAME}"

az network dns record-set ns list --resource-group reformmgmtrg --zone-name $ZONENAME >> "$ZONENAME-ns.json"
nscount=`jq '. | length' $ZONENAME-ns.json`

az network dns record-set a list --resource-group reformmgmtrg --zone-name $ZONENAME >> "$ZONENAME-a.json"
acount=`jq '. | length' $ZONENAME-a.json`

az network dns record-set cname list --resource-group reformmgmtrg --zone-name $ZONENAME >> "$ZONENAME-cname.json"
cnamecount=`jq '. | length' $ZONENAME-cname.json`

echo "Records retrieved .....successfuly....."

echo "Building YAML for ${ZONENAME}"

echo -e "ns:" >> $ZONENAME.yml

for ((e=0; e<$nscount; e++))
  do
    echo "  - name: `cat $ZONENAME-ns.json | jq --argjson k $e '.[$k].name'`" >> $ZONENAME.yml
    echo "    ttl: `cat $ZONENAME-ns.json | jq --argjson k $e '.[$k].ttl'`" >> $ZONENAME.yml
    echo "    record: " >> $ZONENAME.yml
    echo "      - `cat $ZONENAME-ns.json | jq --argjson k $e '.[$k].nsRecords[0].nsdname'`" >> $ZONENAME.yml
    echo "      - `cat $ZONENAME-ns.json | jq --argjson k $e '.[$k].nsRecords[1].nsdname'`" >> $ZONENAME.yml
    echo "      - `cat $ZONENAME-ns.json | jq --argjson k $e '.[$k].nsRecords[2].nsdname'`" >> $ZONENAME.yml
    echo "      - `cat $ZONENAME-ns.json | jq --argjson k $e '.[$k].nsRecords[3].nsdname'`" >> $ZONENAME.yml
  done

echo "" >> $ZONENAME.yml
echo -e "A:" >> $ZONENAME.yml


for ((c=0; c<$acount; c++))
  do
    echo "  - name: `cat $ZONENAME-a.json | jq --argjson i $c '.[$i].name'`" >> $ZONENAME.yml
    echo "    ttl: `cat $ZONENAME-a.json | jq --argjson i $c '.[$i].ttl'`" >> $ZONENAME.yml
    echo "    record: " >> $ZONENAME.yml
    echo "      - `cat $ZONENAME-a.json | jq --argjson i $c '.[$i].arecords[0].ipv4Address'`" >> $ZONENAME.yml
  done

echo "" >> $ZONENAME.yml
echo -e "cname:" >> $ZONENAME.yml

for ((d=0; d<$cnamecount; d++))
  do
    echo "  - name: `cat $ZONENAME-cname.json | jq --argjson j $d '.[$j].name'`" >> $ZONENAME.yml
    echo "    ttl: `cat $ZONENAME-cname.json | jq --argjson j $d '.[$j].ttl'`" >> $ZONENAME.yml
    echo "    record: `cat $ZONENAME-cname.json | jq --argjson j $d '.[$j].cnameRecord.cname'`" >> $ZONENAME.yml
  done


echo "yaml generated successfuly......."