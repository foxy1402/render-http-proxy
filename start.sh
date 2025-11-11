#!/bin/sh
set -eu

echo "Starting proxy in debug mode..."
set -x

PORT=${PORT:-3128}
PROXY_USER=${PROXY_USER:-user}
PROXY_PASS=${PROXY_PASS:-pass}

ls -l /etc/3proxy/
cat /etc/3proxy/3proxy.cfg.tpl
which 3proxy

sed "s/{{PORT}}/${PORT}/g; s/{{USER}}/${PROXY_USER}/g; s/{{PASS}}/${PROXY_PASS}/g" \
    /etc/3proxy/3proxy.cfg.tpl > /etc/3proxy/3proxy.cfg

echo "Starting 3proxy on port ${PORT} with user ${PROXY_USER}"
exec 3proxy /etc/3proxy/3proxy.cfg
