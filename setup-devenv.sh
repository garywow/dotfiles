#!/bin/sh

echo install packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y zsh vim dos2unix wget git gh build-essential

cd ~
wget -q https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh && sudo bash gitflow-installer.sh install stable; rm gitflow-installer.sh
