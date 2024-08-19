#!/bin/bash


# Set config file
cat <<EOF >/fei.json
{
  "log": {
    "loglevel": "none"
  },
  "routing": {
    "domainStrategy": "IPIfNonMatch",
    "rules": [
      {
        "type": "field",
        "port": "0-65535",
        "outboundTag": "wireguard-1"
      }
    ]
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
                "network": "ws",
                "security": "none"
            }
        }
    ],
  "outbounds": [
    {
      "protocol": "wireguard",
      "settings": {
        "secretKey": "uANyk/Mo95AsblVqXXxJYIbLNYfUvQI66NlSkBwQzHc=",
        "address": ["172.16.0.2/32", "2606:4700:110:8949:fed8:2642:a640:c8e1/128"],
        "peers": [
          {
            "publicKey": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
            "endpoint": "engage.cloudflareclient.com:2408"
          }
        ],
        "reserved":[0, 0, 0] // 如果你有的话，粘贴reserved到这里
      },
      "tag": "wireguard-1"
    }
  ]
}
EOF

/usr/local/bin/xr -config /fei.json
