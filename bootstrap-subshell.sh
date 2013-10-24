#!/bin/sh

set -x
set -eu
orig_home="$HOME"

new_home="$HOME/epeli"
read -p "Subshell HOME[$HOME/epeli]> " custom_home
[ "$custom_home" != "" ] && new_home="$custom_home"


mkdir $new_home
cd $new_home
echo ". $orig_home/.bashrc" > ".bashrc"
echo ". $new_home/.bashrc" > ".bash_profile"

cat > $new_home/login<<EOF
#!/bin/sh
export HOME=$new_home
echo
echo "Starting new bash shell Vim superpowers!"
echo
exec bash --login
EOF
chmod +x $new_home/login

export HOME="$new_home"
wget -qO - https://github.com/epeli/vimconfig/raw/master/bootstrap.sh  | sh
cd $new_home/.vim
make friends

set +x
echo
echo "Subshell installed. Start it with $new_home/login"
echo

