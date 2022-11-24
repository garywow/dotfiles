#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$BASEDIR"

[[ -d ~/.dotfiles ]] && rm -fr ~/.dotfiles
cp -f -R . ~/.dotfiles && rm -fr ~/.dotfiles/.git

chmod +x ~/.dotfiles/*.sh
