FROM golang:1.6

MAINTAINER Shaun Crampton <shaun@tigera.io>

ADD . /src
WORKDIR /src

# We want v3.0.0 but the tag for v3.0.0 has broken download links.  Pin to
# master for now :-(
ENV PROTOBUF_TAG master

RUN ./build.sh

ENTRYPOINT ["protoc"]
