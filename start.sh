#!/bin/sh
set -eu

PORT=${PORT:-3128}
PROXY_USER=${PROXY_USER:-user}
PROXY_PASS=${PROXY_PASS:-pass}

sed "s/{{PORT}}/${PORT}/g; s/{{USER}}/${PROXY_USER}/g; s/{{PASS}}/${PROXY_PASS}/g"     /etc/3proxy/3proxy.cfg.tpl > /etc/3proxy/3proxy.cfg

echo "Starting 3proxy on port ${PORT} with user ${PROXY_USER}"
exec 3proxy /etc/3proxy/3proxy.cfg
