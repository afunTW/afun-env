#!/usr/bin/bash

BRANDING_DIR="$HOME/workspace/branding"
mkdir -p $BRANDING_DIR

# remember to setup up ssh auth
ssh -T git@github.com

# blog
git clone git@github.com:afunTW/afunTW.github.io.git "$BRANDING_DIR/afunTW.github.io"
sudo npm install -g hexo-cli

# resume
git clone git@github.com:afunTW/cv.git "$BRANDING_DIR/cv"

# github profile
git clone git@github.com:afunTW/afunTW.git "$BRANDING_DIR/afunTW"
