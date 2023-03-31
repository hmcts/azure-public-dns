#!/usr/bin/env bash

#shellcheck disable=SC2086
echo "ns:"
PREV=
while read -r
do
  RECORD_NAME=$(echo ${REPLY} | cut -f 1 -d ' ')
  TTL=$(echo ${REPLY} | cut -f 2 -d ' ')
  RECORD=$(echo ${REPLY} | cut -f 5 -d ' ')
  if [[ $RECORD_NAME != $PREV ]]; then
    echo "  - name: $RECORD_NAME"
    echo "    ttl: $TTL"
    echo "    record:"
    echo "      - $RECORD"
  else
    echo "      - $RECORD"
  fi
  PREV=$RECORD_NAME
done < NS.txt

echo

PREV=
echo "mx:"
while read -r
do
  RECORD_NAME=$(echo ${REPLY} | cut -f 1 -d ' ')
  TTL=$(echo ${REPLY} | cut -f 2 -d ' ')
  RECORD=$(echo ${REPLY} | cut -f 6 -d ' ')

  if [[ $RECORD_NAME != $PREV ]]; then
    echo "  - name: $RECORD_NAME"
    echo "    ttl: $TTL"
    echo "    record:"
    echo "      - $RECORD"
    else
      echo "      - $RECORD"
  fi
  PREV=$RECORD_NAME
done < MX.txt

echo

PREV=
echo "A:"
while read -r
do
  RECORD_NAME=$(echo ${REPLY} | cut -f 1 -d ' ')
  TTL=$(echo ${REPLY} | cut -f 2 -d ' ')
  RECORD=$(echo ${REPLY} | cut -f 5 -d ' ')

  if [[ $RECORD_NAME != $PREV ]]; then
    echo "  - name: $RECORD_NAME"
    echo "    ttl: $TTL"
    echo "    record:"
    echo "      - $RECORD"
  else
    echo "      - $RECORD"
  fi
  PREV=$RECORD_NAME
done < A.txt

echo

PREV=
echo "txt:"
while read -r
do
  RECORD_NAME=$(echo ${REPLY} | cut -f 1 -d ' ')
  TTL=$(echo ${REPLY} | cut -f 2 -d ' ')
  RECORD=$(echo ${REPLY} | cut -f 5 -d ' ')

  if [[ $RECORD_NAME != $PREV ]]; then
    echo "  - name: $RECORD_NAME"
    echo "    ttl: $TTL"
    echo "    record:"
    echo "      - $RECORD"
  else
    echo "      - $RECORD"
  fi
  PREV=$RECORD_NAME
done < TXT.txt

echo

PREV=
echo "srv:"
while read -r
do
  RECORD_NAME=$(echo ${REPLY} | cut -f 1 -d ' ')
  TTL=$(echo ${REPLY} | cut -f 2 -d ' ')
  RECORD=$(echo ${REPLY} | cut -f 8 -d ' ')

  if [[ $RECORD_NAME != $PREV ]]; then
    echo "  - name: $RECORD_NAME"
    echo "    ttl: $TTL"
    echo "    record:"
    echo "      - $RECORD"
  else
    echo "      - $RECORD"
  fi
  PREV=$RECORD_NAME
done < SRV.txt


echo

echo "cname:"
while read -r
do
  RECORD_NAME=$(echo ${REPLY} | cut -f 1 -d ' ')
  TTL=$(echo ${REPLY} | cut -f 2 -d ' ')
  RECORD=$(echo ${REPLY} | cut -f 5 -d ' ')

    echo "  - name: $RECORD_NAME"
    echo "    ttl: $TTL"
    echo "    record: $RECORD"

done < CNAME.txt

