# Vim Config by Epeli

## Install

Vim and tools

    sudo apt-get install vim-nox git-core tmux curl wget bvi


Checkers and linters for Syntastic (and some other tools)

    sudo npm install -g jshint coffee-script jsonlint stylus less serve yalr
    sudo npm install -g npmlv npm-mkrelease grunt
    sudo gem install sass
    sudo apt-get install pyflakes


Caps Lock to Esc

    xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

Can't live without it.

## Bootstrap

    wget -q --no-check-certificate -O - https://github.com/epeli/vimconfig/raw/master/bootstrap.sh  | sh

## Solarized for gnome-terminal

  * https://github.com/sigurdga/gnome-terminal-colors-solarized

## tmux 1.8

    sudo apt-get install checkinstall libevent-dev libncurses-dev
    wget http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.8/tmux-1.8.tar.gz
    tar xzvf tmux-1.8.tar.gz
    cd tmux-1.8/
    ./configure
    make
    sudo checkinstall

## Influences from

  * http://snk.tuxfamily.org/log/vim-256color-bce.html
  * http://statico.github.com/vim.html
  * https://github.com/skwp/dotfiles
  * http://stevelosh.com/blog/2010/09/coming-home-to-vim/
  * http://nvie.com/posts/how-i-boosted-my-vim/
  * http://net.tutsplus.com/articles/general/top-10-pitfalls-when-switching-to-vim
  * http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricksz
  * http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim
  * http://mislav.uniqpath.com/2011/12/vim-revisited/
  * http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/
  * http://concisionandconcinnity.blogspot.com/2009/07/vim-part-ii-matching-pairs.html
  * http://dancingpenguinsoflight.com/2009/02/code-navigation-completion-snippets-in-vim/
  * http://www.thegeekstuff.com/2009/01/vi-and-vim-editor-5-awesome-examples-for-automatic-word-completion-using-ctrl-x-magic/

## Scripting

:help usr_41.txt

http://www.ibm.com/developerworks/views/linux/libraryview.jsp?end_no=100&lcl_sort_order=asc&type_by=Articles&sort_order=desc&show_all=false&start_no=1&sort_by=Title&search_by=scripting+the+vim+editor&topic_by=All+topics+and+related+products&search_flag=true&show_abstract=true

http://learnvimscriptthehardway.stevelosh.com/


