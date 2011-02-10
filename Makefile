.PHONY install: vimrc
	ln -fvs ~/.vim/vimrc ~/.vimrc
	ln -fvs ~/.vim/gvimrc ~/.gvimrc
	cd ~/.vim/bundle/command-t/ruby/command-t && ruby 'extconf.rb' && make clean && make
	vim -c 'call pathogen#helptags()' -c 'qa!'
