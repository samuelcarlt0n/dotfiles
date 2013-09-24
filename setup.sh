#!/bin/bash

clear

dir=~/dotfiles
files="gitconfig gitignore osx bashrc bash_profile"  # list of files/folders to symlink in homedir
backupdir=~/.dotfiles_backup # folder to put existing dotfiles in

echo "$(tput setaf 2)Creating a backup folder for existing dotfiles $(tput sgr0)"
mkdir $backupdir
echo "$(tput setaf 5)...done $(tput sgr0)"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
    if [ -f ~/.$file ]; then
        echo "$(tput setaf 2)Moving existing $file into $backupdir. $(tput sgr0)"
        mv ~/.$file $backupdir
    fi

    echo
    echo "$(tput setaf 5)Symlinking $file to the home directory. $(tput sgr0)"
    ln -s $dir/$file ~/.$file
done
unset file
