#!/bin/sh

echo install packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y zsh vim dos2unix git gh build-essential
