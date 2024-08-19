#!/bin/bash


# Set config file
cat <<EOF >/fei.json
{
  "log": {
    "loglevel": "info"
  },
  "inbounds": [
        {
            "listen": "0.0.0.0",
            "port": 8000,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                      "id": "9c031bbc-482d-49dd-8383-5ba774ffd50c"
                    }
                ]
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

/usr/local/bin/xr -config /fei.json
