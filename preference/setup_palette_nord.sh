#/usr/bin/bash

INSTALL_DIR="$HOME/workspace/preference/palette"
mkdir -p $INSTALL_DIR

# install
if [ ! -d "$INSTALL_DIR/nord-dircolors" ]; then
    git clone https://github.com/arcticicestudio/nord-dircolors "$INSTALL_DIR/nord-dircolors"
    ln -s "$INSTALL_DIR/nord-dircolors/src/dir_colors" "$HOME/.dir_colors"
fi
