#!/bin/sh

set -x
set -eu
orig_home=$HOME
export HOME=$HOME/.epeli

mkdir $HOME
cd $HOME
echo ". $orig_home/.bashrc" > ".bashrc"
echo ". $HOME/.bashrc" > ".bash_profile"

cat > $HOME/login<<EOF
#!/bin/sh
export HOME=$HOME
echo "Starting new bash shell Vim superpowers!"
exec bash --login
EOF
chmod +x $HOME/login

wget -q --no-check-certificate -O - https://github.com/epeli/vimconfig/raw/master/bootstrap.sh  | sh
cd $HOME/.vim
make friends


