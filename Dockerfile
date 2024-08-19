FROM debian:latest


ADD f.sh /f.sh
ADD xr /usr/local/bin/xr

RUN sudo apt-update && \
    sudo apt-get install -y ca-certificates bash tor gzip && \
    gzexe /f.sh && \
    rm -rf /f.sh~ && \
    chmod +x /f.sh && \
    chmod +x /usr/local/bin/xr && \
    wget git.io/warp.sh && chmod +x warp.sh && sudo ./warp.sh d

CMD /f.sh
