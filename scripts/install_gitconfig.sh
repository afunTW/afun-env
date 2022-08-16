#!/bin/bash

TARGET_DIR="$HOME/.local/share"
mkdir -p $TARGET_DIR

# ####################
# user
# ####################
git config --global user.email "afun@afun.tw"
git config --global user.name "afunTW"

# ####################
# core
# ####################
git config --global core.autocrlf "false"

# ####################
# alias
# ####################
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.cm "commit -m"
git config --global alias.ca "commit --amend"
git config --global alias.br "branch"
git config --global alias.df "diff"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset %an -%C(yellow)%d%Creset %s %Cgreen(%cr)'"
git config --global alias.graphlog "log --oneline --graph --color --all --decorate"
git config --global alias.last "log -1 HEAD"
git config --global alias.unstage "reset HEAD"
git config --global alias.syncbranch "fetch --prune"
git config --global alias.remote.branch.status "remote show origin"

# ####################
# third-parties
# ####################
# diff-so-fancy
if [ ! -d $TARGET_DIR ];then
    echo "$TARGET_DIR not exists. Created"
    mkdir -p $TARGET_DIR
else
    echo "$TARGET_DIR exists."
fi
if [ ! -d "$TARGET_DIR/diff-so-fancy" ]; then
    git clone https://github.com/so-fancy/diff-so-fancy "$TARGET_DIR/diff-so-fancy"
    git config --global core.pager "$TARGET_DIR/diff-so-fancy/diff-so-fancy | less --tabs=4 -RFX"
    git config --global color.ui true
    git config --global interactive.diffFilter "diff-so-fancy --patch"
    git config --global color.diff-highlight.oldNormal    "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal    "green bold"
    git config --global color.diff-highlight.newHighlight "green bold 22"
    git config --global color.diff.meta       "11"
    git config --global color.diff.frag       "magenta bold"
    git config --global color.diff.commit     "yellow bold"
    git config --global color.diff.old        "red bold"
    git config --global color.diff.new        "green bold"
    git config --global color.diff.whitespace "red reverse"
fi
