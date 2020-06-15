set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Neovim, use my Vim configuration. Thanks (NeoVim does not like symlinks)
source ~/.vim/vimrc
