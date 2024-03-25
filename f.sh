#!/bin/bash

# Set config file
cat <<EOF >/fei.json
{
  "log": {
    "loglevel": "none"
  },
  "routing": {
    "domainStrategy": "AsIs",
    "strategy": "rules",
    "settings": {
      "rules": [
        {
          "type": "field",
          "domain": [
            "regexp:\\.onion$"
          ],
          "outboundTag": "tor"
        },
        {
          "type": "field",
          "outboundTag": "block",
          "protocol": [
            "bittorrent"
          ]
        }
      ]
    }
  },
  "inbounds": [
    {
      "listen": "0.0.0.0",
      "port": 8080,
      "protocol": "vless",
      "settings": {
        "clients": [
            {
              "id": "471b2a75-a3a3-48d2-a5c9-9636fb92145f"
            }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
    {
      "protocol": "socks",
      "settings": {
        "servers": [
          {
            "address": "127.0.0.1",
            "port": 9050
          }
        ]
      },
      "tag": "tor"
    },
    {
      "protocol": "blackhole",
      "tag": "block"
    }
  ]
}
EOF

tor &

/usr/local/bin/xr -config /fei.json

