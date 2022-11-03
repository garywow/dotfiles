#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$BASEDIR"

cp -f -R . ~/dotfiles

chmod +x ~/dotfiles/setup-devenv.sh
chmod +x ~/dotfiles/setup-devenv-go.sh
