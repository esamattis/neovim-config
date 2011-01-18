Vim Config by Epeli
===================

Install
=======

Get Vim with python support.
Get exuberant-ctags.

Debian and friends

    sudo apt-get install vim-nox exuberant-ctags pyflakes ack-grep par


Caps Lock to Esc

    xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

Can't live without it.

Installing the config
==================

    wget -q --no-check-certificate -O - https://github.com/epeli/vimconfig/raw/master/setupvim.sh  | bash -eu


Tutorials
=========
http://www.cyberciti.biz/faq/vim-editing-multiple-files-with-windows-buffers/

http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks

http://superuser.com/questions/111016/vim-open-file-at-location-that-was-last-viewed

http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim
