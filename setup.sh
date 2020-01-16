#!/bin/bash

if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
echo $'\nInstalling pathogen'
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if [ ! -d ~/.vim/pack/themes/opt/solarized8 ]; then
echo $'\nInstalling solarized theme'
git clone https://github.com/lifepillar/vim-solarized8.git \
    ~/.vim/pack/themes/opt/solarized8
fi

# airline
if [ ! -d ~/.vim/bundle/vim-airline ]; then
echo $'\nInstalling vim-airline plugin'
  git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
fi

echo $'\nSet .vimrc file'
cat > ~/.vimrc <<EOF

set background=dark
colorscheme solarized8_high
syntax on
set number
execute pathogen#infect()