#!/usr/bin/env sh

set -e

PACKAGES="git unzip"

apt-get update
apt-get install -y $PACKAGES

# Install protoc.
#git clone https://github.com/google/protobuf -b $PROTOBUF_TAG --depth 1
#cd ./protobuf
#./autogen.sh
#./configure --prefix=/usr
#make -j 3
#make check
#make install
#cd ..
#rm -rf ./protobuf

wget https://github.com/google/protobuf/releases/download/v3.5.1/protoc-3.5.1-linux-x86_64.zip
unzip protoc-3.5.1-linux-x86_64.zip -d /usr/

# Install gogo, an optimised fork of the Golang generators.
mkdir -p "$GOPATH/src/github.com/gogo"
cd "$GOPATH/src/github.com/gogo"
git clone https://github.com/gogo/protobuf.git
cd protobuf
git checkout v0.5

go install \
       github.com/gogo/protobuf/protoc-gen-gogo \
       github.com/gogo/protobuf/gogoproto \
       github.com/gogo/protobuf/protoc-gen-gogofast \
       github.com/gogo/protobuf/protoc-gen-gogofaster \
       github.com/gogo/protobuf/protoc-gen-gogoslick

apt-get purge -y $PACKAGES
apt-get clean -y
