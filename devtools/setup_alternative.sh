#!/usr/bin/bash

# cat -> bat
# https://github.com/sharkdp/bat/
sudo apt install -y bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# ls -> exa
wget -O exa.zip https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
unzip exa.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa

# df -> pydf
sudo apt install -y pydf
