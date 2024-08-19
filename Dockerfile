FROM debian:bookworm-slim

ADD f.sh /f.sh
ADD xr /usr/local/bin/xr

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    bash \
    tor \
    gzip \
    wget \
    curl && \
    gzexe /f.sh && \
    chmod +x /f.sh && \
    chmod +x /usr/local/bin/xr && \
    wget -O warp.sh git.io/warp.sh && \
    chmod +x warp.sh && \
    ./warp.sh d && \
    rm warp.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /f.sh
