#!/bin/bash

TARGET_FILE_PATH=$HOME/Downloads/discord.deb

curl -Lo $TARGET_FILE_PATH https://discord.com/api/download?platform=linux&format=deb
wait
sudo apt install -y $TARGET_FILE_PATH
rm $TARGET_FILE_PATH
