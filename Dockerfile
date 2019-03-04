FROM alpine:3.9

WORKDIR /b2

RUN apk --no-cache --update add bash python3 && \
    pip3 install --upgrade pip && \
    pip3 install --no-cache-dir b2

ENTRYPOINT []