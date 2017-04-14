FROM resin/rpi-raspbian:jessie

WORKDIR /tmp

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update                                      && \
    apt-get install -y --no-install-recommends wget     && \
    wget -c https://archive.raspbian.org/raspbian/pool/main/a/apt-cacher-ng/apt-cacher-ng_2-1_armhf.deb && \
    wget -c https://archive.raspbian.org/raspbian/pool/main/g/glibc/libc6_2.24-9_armhf.deb              && \
    wget -c https://archive.raspbian.org/raspbian/pool/main/o/openssl/libssl1.1_1.1.0e-1_armhf.deb      && \
    wget -c https://archive.raspbian.org/raspbian/pool/main/g/gcc-6/libstdc%2b%2b6_6.3.0-11%2brpi1_armhf.deb && \
    wget -c https://archive.raspbian.org/raspbian/pool/main/g/gcc-6/gcc-6-base_6.3.0-11%2brpi1_armhf.deb && \
    wget -c http://archive.raspbian.org/raspbian/pool/main/t/tcp-wrappers/libwrap0_7.6.q-26_armhf.deb   && \
    dpkg -i libwrap0_7.6.q-26_armhf.deb        && \
    dpkg -i gcc-6-base_6.3.0-11+rpi1_armhf.deb && \
    dpkg -i libstdc++6_6.3.0-11+rpi1_armhf.deb && \
    dpkg -i libssl1.1_1.1.0e-1_armhf.deb       && \
    dpkg -i libc6_2.24-9_armhf.deb             && \
    dpkg -i apt-cacher-ng_2-1_armhf.deb        && \
    apt-get remove --purge -y wget             && \
    apt-get clean -y                           && \
    apt-get autoclean -y                       && \
    apt-get autoremove -y                      && \
    apt-get clean all                          && \
    rm -rf /var/lib/{apt,dpkg,cache,log}       && \
    rm -f /tmp/*.deb

COPY files/* /etc/apt-cacher-ng/

EXPOSE 3142
VOLUME ["/var/cache/apt-cacher-ng"]
ENTRYPOINT ["/usr/sbin/apt-cacher-ng"]
CMD ["-c","/etc/apt-cacher-ng"]

