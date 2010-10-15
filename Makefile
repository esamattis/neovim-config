.PHONY ln: vimrc
	ln -fvs ~/.vim/vimrc ~/.vimrc
	ln -fvs ~/.vim/gvimrc ~/.gvimrc
	vim -c 'helptags ~/.vim/bundle/surround/doc' -c 'qa!'
