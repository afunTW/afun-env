#!/usr/bin/bash

TARGET_DIR_PATH=$HOME/.local/bin
TARGET_FILE_PATH=$TARGET_DIR_PATH/Telegram
TMP_FILE_PATH=$HOME/Downloads/Telegram

mkdir -p $TARGET_DIR_PATH
if [ ! -f $TARGET_FILE_PATH ]; then
    wget https://telegram.org/dl/desktop/linux -O- | tar -xJ
    mv Telegram $TMP_FILE_PATH
    ln -s $TMP_FILE_PATH $TARGET_FILE_PATH
fi
