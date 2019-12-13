if [ -e ithc.platform.hmcts.net-resource-ids.tmp ]
then
  rm ithc.platform.hmcts.net-resource-ids.tmp
fi

while IFS="" read -r tmp_line || [ -n "$tmp_line" ]
do
  stringlen=$(echo $tmp_line | awk '{print length}')
  if [ $stringlen -le 1 ]
  then
    # Identidied blank line; literally do nothing
    sleep 0
  else
    printf "$tmp_line\n" >> ithc.platform.hmcts.net-resource-ids.tmp
  fi
done < ithc.platform.hmcts.net-resource-ids.txt

# Swap temp file to main resource id file
rm ithc.platform.hmcts.net-resource-ids.txt
mv ithc.platform.hmcts.net-resource-ids.tmp ithc.platform.hmcts.net-resource-ids.txt
