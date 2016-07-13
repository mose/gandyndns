#!/bin/sh

. ./config
[ -f ./current_ip ] || touch ./current_ip
CURRENT_IP=`cat ./current_ip`

NEW_IP=`curl -s $GETIP_URL`

d=`date`

$DEBUG && echo "$d - Current IP: $CURRENT_IP" >> $LOGFILE
$DEBUG && echo "$d - New IP:     $NEW_IP"     >> $LOGFILE

if [ "$CURRENT_IP" != "$NEW_IP" ]
then
  echo -n "$d - IP changed $CURRENT_IP -> $NEW_IP / " >> $LOGFILE
  curl -s -X PUT -H "Content-Type: application/json" \
    -H "X-Api-Key: $API_KEY" \
    -d "{\"rrset_ttl\": 1800, \"rrset_values\": [\"$NEW_IP\"]}" \
    https://dns.beta.gandi.net/api/v5/zones/$ZONE/records/$SUBDOMAIN/A \
    >> $LOGFILE
  echo >> $LOGFILE
  echo $NEW_IP > ./current_ip
else
  echo "$d - no change" >> $LOGFILE
fi

$DEBUG && echo "$d - Done" >> $LOGFILE
exit 0
