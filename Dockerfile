FROM alpine:3.9

WORKDIR /b2

ENV VERSION=1.3.8

RUN apk --no-cache --update add bash python3 && \
    pip3 install --upgrade pip && \
    pip3 install --no-cache-dir b2==${VERSION}

ENTRYPOINT []