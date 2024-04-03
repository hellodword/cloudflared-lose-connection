#!/usr/bin/env bash

set -e
set -x

rm -f 4G
dd if=/dev/zero of=./4G bs=4k iflag=fullblock,count_bytes count=4G

docker compose up --build -d
docker compose logs -f pub --no-color > /dev/stdout 2>&1 &

while :
do
    sleep 5s
    result="$(docker compose logs pub | grep -oP 'https://[a-z\d\-]+\.trycloudflare.com' | head -1)"
    if [[ ! -z "$result" ]]; then
        time -p curl -f -v --output /dev/null "$result"
        break
    fi
done
