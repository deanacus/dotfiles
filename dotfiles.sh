#!/bin/bash
#
# AUTHOR: Dean Harris
# DATE: 29/1/2013
# VERSION: 0.7
#
# DESCRIPTION:
# Script for managing dotfiles. Takes a copy of the dotfiles from ~/
# and moves them to a backup directory then copies source files to ~/
# Ignores the de facto standard behaviour of creating symlinks in
# favour of creating actual copies of the source files. Intended for
# use with my dotfiles repo https://github.com/deanacus/dotfiles.
#
# Started life as a rip of 
# https://github.com/michaeljsmalley/dotfiles then morphed into its
# current state based on https://github.com/insanum/nostalgic
#

# VARIABLES

# Dotfiles directory
srcdir=~/dotfiles

# Backup directory
bkdir=~/dotfiles_old

# Target directory
tgdir=~

# Dotfiles to be copied (sourced from textfile)
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

# Push function:
# Backs up current working files from ~/ to backup directory then copies source files to ~/
function Push () {
	for file in $files; do
		if [ -f $tgdir/.$file ]; then
			if [ ! -d $bkdir ]; then
				mkdir -p $bkdir
			fi	
			echo "Moving $tgdir/.$file to $bkdir/"
			mv $tgdir/.$file $bkdir/$file
		fi
		echo "Copying $file to $tgdir/$file."
		cp $srcdir/$file $tgdir/.$file
	done
}

# Pull function:
# Moves current source files to a backup directory, then copies working files from ~/ to ensure that source files match working files

function Pull () {
	for file in $files; do
		if [ -f $srcdir/$file ]; then
			if [ ! -d $bkdir ]; then
				mkdir -p $bkdir
			fi
			echo "Moving $srcdir/$file to $bkdir"
			mv $srcdir/$file $bkdir/$file
			echo "Copying $tgdir/.$file to $srcdir."
			cp $tgdir/.$file $srcdir/$file
		fi
	done
}

# Clone function:
# Creates a fresh version of the listed files in a clean, non-git directory for you to start playing with.
function Clone () {
	if [ -z $1 ]; then
		echo "No target directory supplied"
		return 1
		exit
	else
		for file in $files; do
			if [ ! -d $1 ]; then
				echo "Creating directory $1"
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
