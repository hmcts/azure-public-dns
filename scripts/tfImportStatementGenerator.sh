#!/bin/bash

echo "Terraform import commands prep!"

echo "Enter the name of the TF module name for which you need to generate terraform import statements:"
read MODULENAME

echo "Enter the DNS Zone name to import records for terraform import:"
read ZONENAME

echo "Recordset type that you will be imported ==> A, NS, CNAME"

rm -rf $ZONENAME-*.json
rm -rf $ZONENAME-tfimport.sh

RESNAME=$(echo "$TYPE" | tr '[:upper:]' '[:lower:]')

az network dns record-set ns list --resource-group reformmgmtrg --zone-name $ZONENAME >> "$ZONENAME-ns.json"
nscount=`jq '. | length' $ZONENAME-ns.json`

az network dns record-set a list --resource-group reformmgmtrg --zone-name $ZONENAME >> "$ZONENAME-a.json"
acount=`jq '. | length' $ZONENAME-a.json`

az network dns record-set cname list --resource-group reformmgmtrg --zone-name $ZONENAME >> "$ZONENAME-cname.json"
cnamecount=`jq '. | length' $ZONENAME-cname.json`

echo "Records exported .....successfuly....."

echo "Generating import statements for NS recordset"

for ((c=0; c<$nscount; c++))
do
  echo "terraform import module.$MODULENAME.azurerm_dns_ns_record.this[$c] `cat $ZONENAME-ns.json | jq -r --argjson i $c '.[$i].id'` " >> $ZONENAME-tfimport.sh
done

echo "Generating import statements for A recordset"

for ((d=0; d<$acount; d++))
do
  echo "terraform import module.$MODULENAME.azurerm_dns_a_record.this[$d] `cat $ZONENAME-a.json | jq -r --argjson j $d '.[$j].id'` " >> $ZONENAME-tfimport.sh
done

echo "Generating import statements for CNAME recordset"

for ((e=0; e<$cnamecount; e++))
do
  echo "terraform import module.$MODULENAME.azurerm_dns_cname_record.this[$e] `cat $ZONENAME-cname.json | jq -r --argjson k $e '.[$k].id'` " >> $ZONENAME-tfimport.sh
done

echo "TF import commands generated successfuly......."