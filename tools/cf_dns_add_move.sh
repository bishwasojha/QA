#! /bin/sh
#
# Add or move a DNS record ar cloudflare
# References: https://api.cloudflare.com/#dns-records-for-a-zone-list-dns-records
#
# (C) 2021 - jw@owncloud.com

cf_zone_default=owncloud.works

if [ "$1" = "-l" ]; then
  cf_dns_list "$2"
  exit 0
fi

if [ -z "$1" -o "$1$2" = '-' -o "$1$2" = '--' ]; then
  cat <<EOF
Usage:
	$0 IPADDR [FQDN] [BOT:mailaddr]
	$0 IPADDR --poll
	$0 -l [-c]

A cloudflare DNS record for the fully qualified domain name FQDN is created pointing to IPADDR.
If an entry for FQDN already exists, it is first removed, then re-created with the new IPADDR.
To delete an entry, you can pass '-' instead of a valid IPADDR.
To list all entries for an IPADDR, do not pass an FQDN.
To delete all entries for an IPADDR, you can pass '-' instead of a valid FQDN.

The form cf_dns IPADDR --poll tries to log into the machine as root and read ~/env.sh for *fqdn=... setting.

The form cf_dns -l is an alias for cf_dns_list.

The zone used is controlled by the environment variable CLOUDFLARE_DNS_ZONE, which defaults to $cf_zone_default.
(With CLOUDFLARE_DNS_API the URL for a zone API can be directly given. This overrides CLOUDFLARE_DNS_ZONE.)

TODO: If the optional third paramter is given, try to log into the machine and run certbot with the given email address.
EOF
  exit 0
fi

if [ -z "$CLOUDFLARE_DNS_ZONE" ]; then
  export CLOUDFLARE_DNS_ZONE=$cf_zone_default
fi

if [ -n "$CLOUDFLARE_TOKEN" ]; then
  cf_curl () { curl -s -H "Authorization: Bearer $CLOUDFLARE_TOKEN" -H "Content-Type: application/json" -X "$@"; }
elif [ -n "$CLOUDFLARE_API_KEY" -a -n "$CLOUDFLARE_USER" ]; then
  cf_curl () { curl -s -H "X-Auth-Email: $CLOUDFLARE_USER" -H "X-Auth-Key: $CLOUDFLARE_API_KEY" -H "Content-Type: application/json" -X "$@"; }
else
  echo "ERROR: Neither CLOUDFLARE_TOKEN (prefered) nor CLOUDFLARE_API_KEY + CLOUDFLARE_USER are in the environment."
  exit 1
fi

if [ -z "$CLOUDFLARE_DNS_API" ]; then
  cf_zone_id="$(cf_curl GET "https://api.cloudflare.com/client/v4/zones" | jq ".result[] | select(.name == \"$CLOUDFLARE_DNS_ZONE\") | .id " -r)"
  if [ -z "$cf_zone_id" ]; then
    echo "ERROR: could not find CLOUDFLARE_DNS_ZONE '$CLOUDFLARE_DNS_ZONE'"
    exit 1
  fi
  export CLOUDFLARE_DNS_API=https://api.cloudflare.com/client/v4/zones/$cf_zone_id/dns_records
fi

if [ "$2" = '-' -o "$2" = '' ]; then
  json="$(cf_curl GET "$CLOUDFLARE_DNS_API?content=$1" | jq '.result')"
  if [ -z "$json" -o "$json" = "[]" ]; then
    echo "$CLOUDFLARE_DNS_ZONE: No DNS-records found for $1"
    exit 0
  fi
  for fqdn in $(echo "$json"  | jq ".[] | .name" -r); do
    echo "\t$1 <- $fqdn"
  done
  if [ "$2" = '-' ]; then
    for id in $(echo "$json"  | jq ".[] | .id" -r); do
      fqdn="$(echo "$json" | jq ".[] | select(.id == \"$id\") | .name" -r)"
      echo "DELETE $id: $1 <- $fqdn ? (y/n)"
      read a
      if [ "$a" = 'y' -o "$a" = 'Y' -o "$a" = 'z' -o "$a" = 'Z' ]; then
        cf_curl DELETE $CLOUDFLARE_DNS_API/$id | jq '"Success: " + (.success|tostring) +  " " + .errors[0].message'
      fi
    done
  fi
  exit 0
fi

if [ "$2" = '--poll' ]; then
  # Try max 10 min
  for try in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29; do
    fqdn=$(timeout 10 ssh root@$1 grep fqdn= env.sh | sed -e 's/^.*fqdn=//')
    if [ -n "$fqdn" ]; then
      break
    fi
    sleep 10
  done
  echo "$0: Poll result: FQDN = '$fqdn'"
  set $1 $fqdn bot:qa@owncloud.com
  ## Fallthrough...
fi

record_id="$(cf_curl GET "$CLOUDFLARE_DNS_API?name=$2" | jq '.result[0].id' -r)"
echo $record_id
if [ "$record_id" != null -a -n "$record_id" ]; then
  old_ip="$(cf_curl GET "$CLOUDFLARE_DNS_API/$record_id" | jq '.result.content' -r)"
  echo "Press ENTER to remove existing record: $2 -> $old_ip"
  read a
  test -n "$record_id" && cf_curl DELETE $CLOUDFLARE_DNS_API/$record_id | jq '"Success: " + (.success|tostring) +  " " + .errors[0].message'
fi

if [ "$1" != '-' -a -n "$1" ]; then
  cf_curl POST $CLOUDFLARE_DNS_API --data '{"type":"A","name":"'"$2"'","content":"'"$1"'","proxied":false}' | jq
fi

if [ -n "$3" ]; then
  email=$(echo "$3" | cut -d: -f2)
  set -x
  sleep 3; sleep 2; sleep 1
  ssh root@$1 certbot -m "$email" --no-eff-email --agree-tos --redirect -d "$2"
fi
