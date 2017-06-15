#!/bin/bash

export VERBOSE=1
make build

docker build -t hub.goodrain.com/dc-deploy/kube-dns:V1 -f Dockerfile.dnsonly .
