#!/bin/sh

tor &
/xr -config /x.json &
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
