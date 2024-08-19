FROM debian:bookworm

ADD f.sh /f.sh
ADD xr /usr/local/bin/xr

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    bash \
    tor \
    wireguard-tools \
    iproute2 \
    gzip && \
    gzexe /f.sh && \
    chmod +x /f.sh && \
    chmod +x /usr/local/bin/xr && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



ADD wgcf.conf /etc/wireguard/wgcf.conf


CMD /f.sh
