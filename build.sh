#!/usr/bin/env bash

set -eo pipefail

if [[ -z "$1" ]]; then
	echo "build no-tls Dockerfile"
	DOCKERFILE="Dockerfile"
elif [[ ! -d "$1" ]]; then
	echo "$1 not found. Please provide a valid path to the TLS directory"
	exit 1
else
	echo "build tls Dockerfile"
	DOCKERFILE="DockerfileSSL"
	TLS="$1"
fi

docker compose build --build-arg TLS=$TLS --no-cache
