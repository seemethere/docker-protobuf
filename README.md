# protobuf 3 docker

[on docker hub](https://registry.hub.docker.com/u/calico/protoc/)

Docker image with protoc 3 and gogo plugin.  Based on the work by
nanoservice.

## Usage

    # Just print protobuf help message
    docker run -it --rm \
      calico/protoc --help

    # Use current folder for input and output
    docker run -it --rm -v $PWD:/src:rw \
      calico/protoc --cpp_out=. *.proto

    # If you ran into problems with user uid and gid (consider scripting it)
    docker run -it --rm -v $PWD:/user-src:rw -u $(id -u):$(id -g) -w /user-src \
      calico/protoc --cpp_out=. *.proto

## Contributors

* Tigera (added gogo)
* Based on the work by [waterlink](https://github.com/waterlink) Oleksii Fedorov, creator, maintainer
