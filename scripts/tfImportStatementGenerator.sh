#!/bin/bash

echo "Terraform import commands prep!"

echo "Enter the name of the module for which you need to generate terraform import statements:"
read MODULENAME

echo "Enter the Zone name to import records for terraform import:"
read ZONENAME

echo "Enter the type of record that you need to import:"
read TYPE

rm -rf $ZONENAME-*.json
rm -rf $ZONENAME-*-tfimport.sh

RESNAME=${TYPE,,}

az network dns record-set $TYPE list --resource-group reformmgmtrg --zone-name $ZONENAME >> "$ZONENAME-$TYPE.json"

echo "Records exported .....successfuly....."

count=`jq '. | length' $ZONENAME-$TYPE.json`

echo "RecordCount = $count"

for ((c=0; c<$count; c++))
do
  echo "terraform import module.$MODULENAME.azurerm_${RESNAME}_record.this[$c] `cat $ZONENAME-$TYPE.json | jq -r --argjson i $c '.[$i].id'` " >> $ZONENAME-$TYPE-tfimport.sh
done

echo "TF import commands generated successfuly......."