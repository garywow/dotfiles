#!/bin/sh

echo update packages
sudo apt update -y
sudo apt upgrade -y

echo ""
echo install protoc
sudo apt install -y vim protobuf-compiler clang-format dos2unix

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
