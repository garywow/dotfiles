#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$BASEDIR"

cp setup-devenv.sh ~
cp setup-devenv-go.sh ~

chmod +x ~/setup-devenv.sh
chmod +x ~/setup-devenv-go.sh
