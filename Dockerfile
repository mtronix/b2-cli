FROM alpine:3.9

WORKDIR /b2

RUN apk --no-cache --update add bash python py-pip && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir b2

ENTRYPOINT []