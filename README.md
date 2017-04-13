# Dockerised apt-cacher-ng

Apt-Cacher NG is a caching proxy for linux distribution packages, primarily Debian. https://www.unix-ag.uni-kl.de/~bloch/acng/

The container config adds support for alpine packages.

## Run

```
docker run \
  --restart always \
  --detach \
  --volume apt-cacher-ng-vol:/var/cache/apt-cacher-ng:rw \
  --publish 3142:3142 \
  struthio/apt-cacher-ng-rpi
```
