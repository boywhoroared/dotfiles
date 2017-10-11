DOTFILES := $(shell pwd)

.PHONY: install-vim install-nvim install-bash install-git install-vim-plug

all: install-vim install-nvim install-bash install-git

install-vim:
	ln -si $(DOTFILES)/vim/ "$(HOME)/.vim"

install-vim-plug: install-vim
	mkdir -p "$(HOME)/.vim/autoload"
	curl -fLo "$(HOME)/.vim/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

install-nvim:
	mkdir -p "$(HOME)/.config/nvim"
	ln -sfi $(DOTFILES)/nvim/init.vim "$(HOME)/.config/nvim/init.vim"

install-bash:
	ln -fsi $(DOTFILES)/bash/bashrc.d "$(HOME)/bashrc.d"
	ln -fsi $(DOTFILES)/bash/bashrc "$(HOME)/.bashrc"
	ln -fsi $(DOTFILES)/bash/bash_profile "$(HOME)/.bash_profile"

install-git:
	ln -fsi $(DOTFILES)/git/gitconfig "$(HOME)/.gitconfig"
