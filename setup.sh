#!/bin/bash

clear

dir=~/dotfiles
files="gitconfig gitignore osx bashrc bash_profile"  # list of files/folders to symlink in homedir

echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
    echo "Symlinking $file to the home directory."
    ln -s $dir/$file ~/.$file
done
unset file
