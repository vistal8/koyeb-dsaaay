FROM debian:bookworm-slim

ADD f.sh /f.sh
ADD xr /usr/local/bin/xr

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    bash \
    tor \
    gzip \
    wget && \
    gzip /f.sh && \
    chmod +x /f.sh && \
    chmod +x /usr/local/bin/xr && \
    wget -O warp.sh git.io/warp.sh && \
    chmod +x warp.sh && \
    ./warp.sh d && \
    rm warp.sh && \
    rm -rf /var/lib/apt/lists/*

CMD /f.sh
