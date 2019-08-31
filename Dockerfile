FROM alpine:latest

ARG OPENCC_VERSION="ver.1.0.5"

RUN apk add cmake doxygen g++ make git python \
    && cd /tmp && git clone https://github.com/BYVoid/OpenCC.git && cd OpenCC \
    && git checkout -b ${OPENCC_VERSION} \
    && make \
    && make install \
    && mkdir -p /usr/lib64 \
    && cp /usr/lib/libopencc.so.2 /usr/lib64/libopencc.so.2 \
    && apk del make doxygen cmake
