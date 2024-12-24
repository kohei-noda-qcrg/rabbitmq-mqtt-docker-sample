#!/usr/bin/env bash

set -eo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [[ -z "$1" ]]; then
	echo "build no-tls Dockerfile"
	echo -e "DOCKERFILE=Dockerfile\nPORTMAP=1883:1883" > $script_dir/.env
elif [[ ! -d "$1" ]]; then
	echo "$1 not found. Please provide a valid path to the TLS directory"
	exit 1
else
	echo "build tls Dockerfile"
	echo -e "DOCKERFILE=DockerfileSSL\nPORTMAP=8883:8883\nTLS=$1" > $script_dir/.env
fi

docker compose build --no-cache
