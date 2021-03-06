FROM ubuntu:latest
MAINTAINER Andrea Grazioso <grazioandre@gmail.com>

COPY init_config.sh /usr/bin/init_config
COPY peaks_init.sh /usr/bin/peaks_init
COPY srv /srv/service
RUN set -ex \
    && apt-get update \
    && apt-get install -y build-essential m4 curl python cmake git libcurl4-openssl-dev libpcre3-dev libicu-dev libgcrypt11-dev zlib1g-dev libbz2-dev libgmp-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev libmysqlcppconn-dev\
    && git clone --recursive git://github.com/r4yan2/peaks.git \
    && cd peaks \
    && mkdir -p /etc/peaks \
    && TARGET=Docker bash ./compile_libraries.sh \
    && mkdir build && pushd build/ \
    && cmake -DCMAKE_BUILD_TYPE=Docker -DDBMANAGER=MYSQL .. \
    && make -j`cat /proc/cpuinfo | grep processor | wc -l` \
    && cd ../bin \
    && install -m755 ./peaks /usr/bin/peaks \
    && cp peaks_config /srv/ \
    && cp membership /srv/ \
    && cp config.js /srv/ \
    && cd ../.. \
    && rm -rf peaks \
    && apt-get install -y daemontools \
    && apt-get autoclean

EXPOSE 80 443 11371 11370
CMD ["svscan", "/etc/peaks/service"]
