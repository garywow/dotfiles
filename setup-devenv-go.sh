#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

GOVER=1.19.3

install_go () {
    echo ""
    echo install go $GOVER
    cd ~
    GOPKG=go${GOVER}.linux-amd64.tar.gz
    [[ -f $GOPKG ]] && rm -f $GOPKG
    wget -O $GOPKG https://go.dev/dl/$GOPKG || exit

    GOLOCAL=go${GOVER}
    [[ -d /usr/local/go ]] && sudo rm -fr /usr/local/go
    sudo tar -C /usr/local -xzf $GOPKG || exit
    rm $GOPKG
}

install_golibs () {
    echo ""
    echo install protoc

    APT_BIN=$( which apt 2> /dev/null )
    DNF_BIN=$( which dnf 2> /dev/null )

    if [ -n "$APT_OK" ]; then
        sudo apt install -y protobuf-compiler clang-format || exit
    fi

    if [ -n "$DNF_OK" ]; then
        echo Not implemented yet
    fi
}

install_go
install_golibs

GOBIN=/usr/local/go/bin/go
$GOBIN env -w GOPROXY=https://goproxy.io,direct

echo ""
echo go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
$GOBIN install google.golang.org/protobuf/cmd/protoc-gen-go@latest

echo ""
echo go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
$GOBIN install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

echo ""
echo go install github.com/swaggo/swag/cmd/swag@latest
$GOBIN install github.com/swaggo/swag/cmd/swag@latest

echo ""
