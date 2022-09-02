FROM alpine:edge

ADD fei.sh /fei.sh
ADD x /usr/local/bin/xr

RUN apk update && \
    apk add -f --no-cache ca-certificates bash && \
    chmod 777 /fei.sh && \
    chmod 777 /usr/local/bin/xr

CMD /fei.sh
