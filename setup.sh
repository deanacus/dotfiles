#!/bin/bash
############################
# setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Shamelesst ripped from https://github.com/michaeljsmalley/dotfiles
############################

########## Variables

# Dotfiles directory
dir=~/dotfiles
# Old dotfiles backup
olddir=~/dotfiles_old
# Dotfiles to be linked
files="bash_aliases bash_functions bash_profile bsh_prompt bash_exports gitconfig"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	if [ -f ~/.$file ]
		mv ~/.$file $olddir/
	fi	
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done