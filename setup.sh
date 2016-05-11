#!/bin/bash

set -u

clear

files=".gitconfig .gitignore .bashrc .bash_profile"  # list of files/folders to symlink in homedir
CURRENT_DIR=`pwd`
BACKUP_DIR=~/.dotfiles_backup  # folder to put existing dotfiles in

echo "$(tput setaf 2)Creating a backup folder for existing dotfiles $(tput sgr0)"
mkdir -p $BACKUP_DIR

for file in $files; do
    if [ -f $CURRENT_DIR/$file ]; then
        echo "$(tput setaf 2)Moving existing $file into $BACKUP_DIR. $(tput sgr0)"
        mv ~/$file $BACKUP_DIR
    fi

    echo "$(tput setaf 5)Symlinking $file to the home directory. $(tput sgr0)"
    ln -s $CURRENT_DIR/$file ~/$file
done

unset file
