#! /bin/bash
# Reference: https://owncloud.dev/clients/web/deployments/oc10-app/
#

source ./env.sh	# requires oc10_fqdn

conf=/var/www/owncloud/config/config.json
if [ -f $conf ]; then
  echo "$0 skipped, config file already exists."
  echo "HINT: To re-run this script, remove $conf"
  sleep 5
  exit 0
fi

test -z "$oc10_fqdn" && oc10_fqdn="web-$(date +%Y%m%d).jw-qa.owncloud.works"
occ app:enable oauth2
occ app:enable web
client_id="$(tr -dc 'a-z0-9' < /dev/urandom | head -c 32)"
client_secret="$(tr -dc 'a-z0-9' < /dev/urandom | head -c 32)"
web_baseurl="https://$oc10_fqdn/index.php/apps/web"
occ config:system:set web.baseUrl --value $web_baseurl
occ oauth:add-client "ownCloud Web" $client_id $client_secret $web_baseurl/oidc-callback.html

# rewriteLinks=true: redirect public and private links to the new web UI
occ config:system:set web.rewriteLinks --type boolean --value true
## defaultapp='web': make the new web UI the default entry point. (classic UI: defaultapp='files')
## FIXME: only when we are sure it really works...
occ config:system:set defaultapp --value web

cat <<EOF > $conf
{
  "server" : "https://$oc10_fqdn",
  "theme": "https://$oc10_fqdn/themes/owncloud/theme.json",
  "auth": {
    "clientId": "$client_id",
    "url":     "https://$oc10_fqdn/index.php/apps/oauth2/api/v1/token",
    "authUrl": "https://$oc10_fqdn/index.php/apps/oauth2/authorize"
  },
  "apps" : [
    "files",
    "preview",
    "draw-io"
  ],
  "applications" : [
    {
      "title": {
        "en": "Classic Design",
        "de": "Klassisches Design",
        "fr": "Design classique",
        "zh_CN": "文件"
      },
      "icon": "swap-box",
      "url": "https://$oc10_fqdn/index.php/apps/files"
    },
    {
      "icon": "settings-4",
      "menu": "user",
      "target": "_self",
      "title": {
        "de": "Einstellungen",
        "en": "Settings"
      },
      "url": "https://$oc10_fqdn/index.php/settings/personal"
    }
  ]
}
EOF
chown www-data. $conf

