FROM ubuntu:latest
MAINTAINER Andrea Grazioso <grazioandre@gmail.com>

RUN set -ex \
    && apt-get update \
    && apt-get install -y build-essential m4 curl python cmake git libcurl4-openssl-dev libpcre3-dev libicu-dev libgcrypt11-dev zlib1g-dev libbz2-dev libgmp-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev libboost-regex-dev libmysqlcppconn-dev \
    && git clone --recursive git://github.com/r4yan2/peaks.git \
    && cd peaks \
    && mkdir -p /var/lib/peaks \
    && cp bin/* /var/lib/peaks/ \
    && bash ./compile_libraries.sh release full\
    && install -m755 lib/cppcms/bin/* /usr/local/bin/ \
    && mkdir build && cd build/ \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make -j4

#COPY peaks /etc/init.d/peaks
VOLUME /var/lib/peaks
EXPOSE 11371 11370
ENTRYPOINT ["/peaks/bin/peaks"]
CMD ["--help"]
