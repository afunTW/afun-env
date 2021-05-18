#!/bin/bash

for KEY in $@; do
    PUBKEY=$(echo $KEY | sed -e 's/^........//')
    # get key
    gpg --keyserver keyserver.ubuntu.com --recv-keys $PUBKEY
    # input key
    gpg --export --armor $PUBKEY | sudo apt-key add -
done
