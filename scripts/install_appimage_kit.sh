#!/bin/bash

if [ "$(lsb_release -cs)" = 'jammy' ]; then
    sudo add-apt-repository universe
    sudo apt install -y libfuse2
else
    sudo apt install fuse libfuse2
    sudo modprobe fuse
    sudo groupadd fuse
    user="$(whoami)"
    sudo usermod -a -G fuse $user
fi
