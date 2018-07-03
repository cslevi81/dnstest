#!/bin/bash
#
# Nameserver performance test

declare -A nameservers
declare -A results
declare -a tested_domains

nameservers[Telekom]="195.228.240.85"
nameservers[Digi]="193.110.56.1"
nameservers[UPC]="195.184.180.4"
nameservers[Google]="8.8.8.8"
nameservers[Quad9]="9.9.9.9"
nameservers[C.F.]="1.1.1.1"
nameservers[OpenDNS]="208.67.222.222"
nameservers[Norton]="199.85.126.20"

tested_domains=(
  "index.hu"
  "origo.hu"
  "kuruc.info"
  "mobile.de"
  "bbc.co.uk"
  "wired.co.uk"
  "amd.com"
  "arstechnica.com"
  "cannondale.cn"
  "ferrari.cn"
)

dns_header="\t"
testcase=10

for a_nameserver in "${!nameservers[@]}"; do
  dns_header+="\t$a_nameserver"
done
echo -e "$dns_header"

for a_domain in "${tested_domains[@]}"; do
  for a_nameserver in "${!nameservers[@]}"; do
    sum=0
    for (( i=1; i<=testcase; i++)); do
      result=$(dig $a_domain @${nameservers[$a_nameserver]} \
      | grep "Query time"\
      | awk '{print $4}')
      sum=$((result+sum))
    done
    results[$a_domain]+="$((sum/testcase))\t"
  done
  if [ ${#a_domain} -lt 8 ]; then
    echo -e "$a_domain\t\t${results[$a_domain]}"
  else
    echo -e "$a_domain\t${results[$a_domain]}"
  fi
done
