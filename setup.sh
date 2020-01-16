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

if [ ! -d ~/.vim/bundle/vim-airline ]; then
echo $'\nInstalling vim-airline plugin'
  git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
fi

if [ ! -d ~/.vim/bundle/vim-fugitive ]; then
  echo $'\nInstalling vim-fugitive plugin'
  cd ~/.vim/bundle
  git clone https://github.com/tpope/vim-fugitive
fi

if [ ! -d ~/.vim/bundle/ctrlp.vim ]; then
  echo $'\nInstalling ctrlp plugin'
  cd ~/.vim
  git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim
fi

if [ -f ~/.vimrc ]; then
  echo $'\nBackup .vimrc to .vimrc_copy'
  cp ~/.vimrc ~/.vimrc_copy
fi

echo $'\nInit .vimrc file'
cat > ~/.vimrc <<EOF

set background=dark
colorscheme solarized8_high
syntax on
set number
let g:airline_powerline_fonts = 1
execute pathogen#infect()

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

EOF
