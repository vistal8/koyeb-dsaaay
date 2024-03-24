#!/bin/bash

# Set config file
cat <<EOF >/fei.json
{
  "log": {
    "loglevel": "none"
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
  ]
}
EOF

tor &

/usr/local/bin/xr -config /fei.json &

