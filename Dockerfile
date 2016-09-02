FROM golang:1.6

MAINTAINER Shaun Crampton <shaun@tigera.io>

ADD . /src
WORKDIR /src

ENV PROTOBUF_TAG v3.0.0

RUN ./build.sh

ENTRYPOINT ["protoc"]
