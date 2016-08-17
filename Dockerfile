FROM golang:1.6

MAINTAINER Shaun Crampton <shaun@tigera.io>

ADD . /src
WORKDIR /src

ENV PROTOBUF_TAG v3.0.0

RUN ./build.sh

# Install the gogo protoc extensions.
RUN go get github.com/gogo/protobuf/proto \
           github.com/gogo/protobuf/protoc-gen-gogo \
           github.com/gogo/protobuf/gogoproto \
           github.com/gogo/protobuf/protoc-gen-gogofast \
           github.com/gogo/protobuf/protoc-gen-gogofaster \
           github.com/gogo/protobuf/protoc-gen-gogoslick

ENTRYPOINT ["protoc"]
