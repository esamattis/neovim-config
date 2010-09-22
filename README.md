Vim Config by Epeli
==================

Install
=======
Get Vim with python support.
Get exuberant-ctags.

Debian and friends

    sudo apt-get install vim-nox exuberant-ctags pyflakes ack-grep

Fedora

    sudo yum install ctags-etags pyflakes subversion

Getting the config
=================

    $ mv ~/.vim ~/.vim_old
    $ mv ~/.vimrc ~/.vimrc_old


    $ git clone http://github.com/epeli/vimconfig.git ~/.vim
or
    $ svn checkout http://svn.github.com/epeli/vimconfig.git ~/.vim


    $ cd ~/.vim
    $ make


For ack

    $ :helptags ~/.vim/doc


Tutorials
=========
http://www.cyberciti.biz/faq/vim-editing-multiple-files-with-windows-buffers/
