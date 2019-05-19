FROM alpine:latest
MAINTAINER Andrea Grazioso <grazioandre@gmail.com>

COPY init_config.sh /usr/bin/init_config
COPY peaks_init.sh /usr/bin/peaks_init
COPY srv /srv/service

RUN set -ex \
    && apk update \
    && apk add alpine-sdk m4 perl cmake pcre-dev gmp-dev curl-dev libgcrypt-dev python bzip2-dev mariadb-connector-c-dev \
    && git clone --recursive https://github.com/r4yan2/peaks /peaks \
    && cd peaks/ \
    && TARGET=Docker sh ./compile_libraries.sh \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Docker -DDBMANAGER=MARIADBCPP .. \
    && make -j`cat /proc/cpuinfo | grep processor | wc -l` \
    && cd ../bin \
    && install -m755 ./peaks /usr/bin/peaks \
    && cp peaks_config /srv/ \
    && cp membership /srv/ \
    && cp config.js /srv/ \
    && cd / \
    && rm -rf peaks/ \
    && apk del alpine-sdk m4 perl cmake pcre-dev gmp-dev curl-dev libgcrypt-dev python bzip2-dev mariadb-connector-c-dev \
    && apk add s6

EXPOSE 80 443 11371 11370
CMD ["s6-svscan", "/etc/peaks/service"]
