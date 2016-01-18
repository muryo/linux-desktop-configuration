#! /bin/bash
# This is a setup script to make all the symlinks and directories and
# install some necessary package.
DIR="$( cd "$(dirname "$0")" && pwd)"

ln -sf $DIR/vimrc $HOME/.vimrc
ln -sf $DIR/bashrc $HOME/.bashrc
