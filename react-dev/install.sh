#!/bin/bash

# nvm
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
	cd "$NVM_DIR"
	git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
) && . "$NVM_DIR/nvm.sh"

# install node by nvm
nvm install node
nvm use node

# install live server
npm install -g live-server

# install webpack
# npm install -D webpack webpack-dev-server

# install babel
# babel-cli: execute ES6/ES7/JSX by command, e.g. `babel-node source.babel.js`
# babel-core: babel core lib
# babel-loader: webpack loader
# babel-preser-*: for different syntax
# npm install -D babel-cli babel-core babel-loader babel-preset-es2015 babel-preset-stage-0 babel-preset-react

# [option] install third party lib by npm (not cdn)
# npm install -S react react-dom redux react-redux immutable

# [option] for maintaining component state
# React Hot Loader
# npm install -S react-hot-loader@3.0.0-beta.1
