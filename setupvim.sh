#!/bin/bash -eu

function backup {
    if [[ -e $1 ]] ; then
        mv $1 $1_$(date +"%F_%H-%M-%S")
    fi
}

cd

backup ~/.vim
backup ~/.vimrc
backup ~/.gvimrc

git clone http://github.com/epeli/vimconfig.git ~/.vim
cd ~/.vim
git remote add sshorigin git@github.com:epeli/vimconfig.git
make install


