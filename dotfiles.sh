#!/bin/bash
#
# dotfiles.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Shamelessy ripped from https://github.com/michaeljsmalley/dotfiles
# 

# Variables 

# Dotfiles directory
srcdir=~/dotfiles

# Backup directory
bkdir=~/dotfiles_old

# Target directory
tgdir=~

# Dotfiles to be copied
files=$(cat $srcdir/sourcefiles.txt)


# Functions

function Usage() {
echo "Usage: ./dotfiles.sh <cmd>

 Commands:
	push			Push dotfiles from source to ~
	pull			Pull dotfiles from ~ to source
	clone <path>	Create a clone of your source directory at <path>
"
}

function Push () {
	for file in $files; do
		if [ -f $tgdir/.$file ]; then
			if [ -d $bkdir ]; then
				echo "Moving $tgdir/.$file to $bkdir/"
				mv $tgdir/.$file $bkdir/$file
			else
				mkdir -p $bkdir
				echo "Moving $tgdir/.$file to $bkdir/"
				mv $tgdir/.$file $bkdir/$file
			fi
		fi
		echo "Copying $file to $tgdir/$file."
		cp $srcdir/$file $tgdir/.$file
	done
}


function Pull () {
	for file in $files; do
		if [ -d $bkdir ]; then
			if [ -f $srcdir/$file ]; then
				echo "Moving $source/$file to $bkdir"
				mv $srcdir/$file $bkdir/$file
			fi
		else
			mkdir -p $bkdir
			if [ -f $srcdir/$file ]; then
				echo "Moving $source/$file to $bkdir"
				mv $srcdir/$file $bkdir/$file
			fi
		fi
		echo "Copying $tgdir/.$file to $srcdir."
		cp $tgdir/$file $srcdir/$file
	done
}

function Clone () {
	if [ -z $1 ]; then
		echo "No target directory supplied"
		return 1
		exit
	else
		for file in $files; do
			if [ ! -d $1 ]; then
				mkdir -p $1
			fi
			cp $srcdir/$file $1/$file
		done
		#echo "$1"
	fi
}

case $1 in
    push)	Push	;;
    pull)	Pull	;;
	clone)	shift; Clone $@	;;
    *)		Usage	;;
esac
