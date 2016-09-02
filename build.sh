#!/usr/bin/env sh

set -e

PACKAGES="git make autoconf automake libtool unzip"

apt-get update
apt-get install -y $PACKAGES

# Install protoc.
git clone https://github.com/google/protobuf -b $PROTOBUF_TAG --depth 1
cd ./protobuf
./autogen.sh
./configure --prefix=/usr
make -j 3
make check
make install
cd ..
rm -rf ./protobuf

# Install gogo, an optimised fork of the Golang generators.
go get github.com/gogo/protobuf/proto \
       github.com/gogo/protobuf/protoc-gen-gogo \
       github.com/gogo/protobuf/gogoproto \
       github.com/gogo/protobuf/protoc-gen-gogofast \
       github.com/gogo/protobuf/protoc-gen-gogofaster \
       github.com/gogo/protobuf/protoc-gen-gogoslick

apt-get purge -y $PACKAGES
apt-get clean -y
