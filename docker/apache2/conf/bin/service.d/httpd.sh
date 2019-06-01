#!/usr/bin/env bash

source /opt/docker/provision/entrypoint.d/20-apache.sh

# Init vars
if [[ -z "$SERVICE_APACHE_OPTS" ]]; then SERVICE_APACHE_OPTS=""; fi

source /opt/local/bin/config.sh

includeScriptDir "/opt/docker/bin/service.d/httpd.d"

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2*.pid

source /etc/apache2/envvars
exec apache2 -DFOREGROUND -DAPACHE_LOCK_DIR $SERVICE_APACHE_OPTS
