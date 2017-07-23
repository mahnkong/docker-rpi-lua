FROM resin/rpi-raspbian:jessie

MAINTAINER Andreas Mahnke <mahnkong@gmx.de>

ENV LUA_ROCKS_VERSION=2.4.2

RUN echo 'deb http://ftp.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list \
    && DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y lua5.3 lua5.3-dev -t jessie-backports \
    && ln -s /usr/bin/lua5.3 /usr/bin/lua \
    && ln -s /usr/bin/luac5.3 /usr/bin/luac

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl tar unzip build-essential gcc \
    && curl -kL https://luarocks.org/releases/luarocks-${LUA_ROCKS_VERSION}.tar.gz > luarocks-${LUA_ROCKS_VERSION}.tar.gz \
    && tar zxpf luarocks-${LUA_ROCKS_VERSION}.tar.gz \
    && cd luarocks-${LUA_ROCKS_VERSION} \
    && ./configure \
    && make bootstrap

ENTRYPOINT ["lua"]

