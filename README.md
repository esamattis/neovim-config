# Vim Config by Epeli

## Install

Get Vim with python support.
Get exuberant-ctags.

Debian and friends

    sudo apt-get install vim-nox exuberant-ctags pyflakes ack-grep par python2.6-doc python-django-doc

For command-t

    sudo apt-get install ruby1.8-dev

Caps Lock to Esc

    xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

Can't live without it.

## Installing the config

    wget -q --no-check-certificate -O - https://github.com/epeli/vimconfig/raw/master/setupvim.sh  | bash -eu

## Influences from

http://stevelosh.com/blog/2010/09/coming-home-to-vim/

http://nvie.com/posts/how-i-boosted-my-vim/

http://net.tutsplus.com/articles/general/top-10-pitfalls-when-switching-to-vim

http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks

http://superuser.com/questions/111016/vim-open-file-at-location-that-was-last-viewed

http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim
