.PHONY: install-vim  install-bashrc.d

install-vim:
	mkdir -pv "$(HOME)"/.vim
	install -m 0644 -- vim/* "$(HOME)"/.vim

install-bashrc.d:
	mkdir -pv "$(HOME)"/.bashrc.d
	install bash/.bashrc.d/* "$(HOME)"/.bashrc.d

