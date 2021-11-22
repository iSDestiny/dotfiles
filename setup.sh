#!/bin/bash
# Script to setup a new linux machine (ubuntu)

root_dir=$(git rev-parse --show-toplevel)

# link .vimrc
ln -s "$root_dir/.vimrc" ~/.vimrc

apt update
apt-get update

# install neovim
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install neovim

# setup neovim configs
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
update-alternatives --install $(which vim) vim $(which nvim) 10

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install fzf
apt-get install fzf

# install ranger
apt-get install ranger

# install silver-searcher
apt-get install silversearcher-ag

# install latest node.js
curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
apt-get install -y nodejs

# install npm
apt install npm

# install golang
snap install go
