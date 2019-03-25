#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
apt-get update && apt-get upgrade -y
# install wget to download jexus, curl for healthcheck.
apt-get install -y curl procps
curl --location --output jexus-6.0.0-x64.tar.gz https://linuxdot.net/down/jexus-6.0.0-x64.tar.gz
tar -zxf jexus-6.0.0-x64.tar.gz && rm jexus-6.0.0-x64.tar.gz
mv jexus /usr/ && cd /usr/jexus && /usr/jexus/jws regsvr
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*
