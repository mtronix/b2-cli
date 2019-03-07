# Backblaze B2 CLI in Docker

[Backblaze B2](https://www.backblaze.com/b2/cloud-storage.html) command line interface wrapped in docker. \
Image is based on [Alpine Linux](https://alpinelinux.org/) lightweight and secure Linux distribution.

## Building
To build image execute one of below commands:
```bash
docker build -t mtronix/b2-cli:latest .
docker build -t mtronix/b2-cli:latest 'https://github.com/mtronix/b2-cli.git#master'
docker build -t mtronix/b2-cli:0.0.1 'https://github.com/mtronix/b2-cli.git#v0.0.1'
```

Better way is to download it from [Docker Hub](https://hub.docker.com/r/mtronix/b2-cli):
```bash
docker pull mtronix/b2-cli:latest
```

## Examples

Sample script which backups file ```db.sql``` into B2 bucket:

```bash
#!/usr/bin/env bash

set -e

IMAGE='mtronix/b2-cli:0.0.1'

B2_KEY_ID='<b2_key_id>'
B2_KEY='<b2_key>'
BUCKET_NAME='<bucket_name>'

SOURCE_FILE='db.sql'

# Execute backup command and remove container
docker run --rm \
    --volume `pwd`:/b2 \
    $IMAGE \
    bash -c "b2 authorize-account $B2_KEY_ID $B2_KEY && b2 upload-file $BUCKET_NAME $SOURCE_FILE $(basename $SOURCE_FILE)"
```