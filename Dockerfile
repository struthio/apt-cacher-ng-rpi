FROM resin/rpi-raspbian:jessie

WORKDIR /tmp

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-cacher-ng && \
    apt-get clean all

COPY files/* /etc/apt-cacher-ng/

EXPOSE 3142
VOLUME ["/var/cache/apt-cacher-ng"]
ENTRYPOINT ["/usr/sbin/apt-cacher-ng"]
CMD ["-c","/etc/apt-cacher-ng"]

