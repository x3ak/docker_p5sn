#!/usr/bin/env bash
# Make sure only root can run this script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root!" 1>&2
   exit 1
fi
ROOT_DIR="$( cd $( dirname $( dirname "$0" )) && pwd)/app";

echo "Setting ACL on cache, logs and var folders"
APACHEUSER=application
setfacl -R -m u:$APACHEUSER:rwX -m u:`whoami`:rwX ${ROOT_DIR}/app/cache ${ROOT_DIR}/app/logs
setfacl -dR -m u:$APACHEUSER:rwX -m u:`whoami`:rwX ${ROOT_DIR}/app/cache ${ROOT_DIR}/app/logs

echo "Setting 777 permissions on cache, logs, var and web images"
chmod -R 777 ${ROOT_DIR}/app/cache ${ROOT_DIR}/app/logs ${ROOT_DIR}/web/img ${ROOT_DIR}/web/bundles_img