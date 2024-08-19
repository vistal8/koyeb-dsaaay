FROM alpine:edge


ADD f.sh /f.sh
ADD xr /usr/local/bin/xr

RUN apk update && \
    apk add -f --no-cache ca-certificates bash tor gzip && \
    gzexe /f.sh && \
    rm -rf /f.sh~ && \
    chmod 777 /f.sh && \
    chmod 777 /usr/local/bin/xr

CMD /f.sh
