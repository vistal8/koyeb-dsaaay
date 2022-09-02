FROM alpine:edge

ARG AUUID="d8b6af50-11dd-46ae-b598-6701778ce6b3"
ARG CADDYIndexPage="https://github.com/cristianCeamatu/microverse-HTML-CSS-capstone-project-online-shop-for-electronics/archive/master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD x /x
ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/x.json /tmp/x.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
