#!/usr/bin/bash

sudo apt update
sudo apt install -y git curl tree

./devtools/setup_alternative.sh
./devtools/setup_gitconfig.sh
./devtools/setup_zshrc.sh
