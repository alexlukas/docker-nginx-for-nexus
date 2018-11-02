#!/bin/ash

set -ex

sed -i "s/NEXUS_HOST/${NEXUS_HOST:-nexus}/g" /etc/nginx/conf.d/nexus-backend.conf
sed -i "s/NEXUS_WEB_PORT/${NEXUS_WEB_PORT:-8081}/g" /etc/nginx/conf.d/nexus-backend.conf
sed -i "s/NEXUS_DOCKER_PORT/${NEXUS_DOCKER_PORT:-5000}/g" /etc/nginx/conf.d/nexus-backend.conf

nginx -g "daemon off;"