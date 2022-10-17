#!/bin/sh

~/prepare-env.sh

echo ""
echo install protoc
sudo apt install -y protobuf-compiler clang-format

go env -w GOPROXY=https://goproxy.io,direct

echo ""
echo go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest

echo ""
echo go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

echo ""
echo go install github.com/swaggo/swag/cmd/swag@latest
go install github.com/swaggo/swag/cmd/swag@latest

echo ""
