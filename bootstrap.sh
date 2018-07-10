#!/bin/bash

# Set come color variables so we can make shit look pretty

BLACK=`tput setaf 000`
RED=`tput setaf 001`
GREEN=`tput setaf 002`
YELLOW=`tput setaf 003`
BLUE=`tput setaf 004`
MAGENTA=`tput setaf 005`
CYAN=`tput setaf 006`
WHITE=`tput setaf 007`

DIM=`tput dim`
BOLD=`tput bold`
RESET=`tput sgr0`

# We're going to need sudo access, so first things first, let's check if we've got it:

if [[ $EUID -ne 0 ]]; then
    echo $RED"Please run this script as root"$RESET;
    echo "";
    echo "USAGE: sudo $0";
    exit;
fi

# Set computer name

echo $GREEN"Set the computer name:"$RESET
read comp_name

scutil --set ComputerName $comp_name
scutil --set HostName $comp_name
scutil --set LocalHostName $comp_name

## Keyboard and Mouse

echo ""
echo $GREEN"Expanding the save panel by default"$RESET
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo ""
echo $GREEN"Disabling the 'Are you sure you want to open this application?' dialog"$RESET
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo ""
echo $GREEN"Disabling \"Natural\" scrolling"$RESET
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo ""
echo $GREEN"Enabling full keyboard access in system dialogs"$RESET
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo ""
echo $GREEN"Stoping media keys launching iTunes"$RESET
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

## Finder stuff

echo ""
echo $GREEN"Showing the Finder status bar and path bar"$RESET
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

echo ""
echo $GREEN"Showing the POSIX path in Finder window title bar"$RESET
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo ""
echo $GREEN"Setting new Finder windows to launch in ~/"$RESET
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

echo ""
echo $GREEN"Setting default Finder view to \"List\""$RESET
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo ""
echo $GREEN"Keeping folders on top when sorting by name"$RESET
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo ""
echo $GREEN"Showing file extensions by default and disabling the extension change warning"$RESET
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo ""
echo $GREEN"Showing all mounted volumes on the desktop"$RESET
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

echo ""
echo $GREEN"Avoiding creating .DS_Store files on network volumes"$RESET
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## Dock Stuff

echo ""
echo $GREEN"Clearing the Dock"$RESET
defaults write com.apple.dock persistent-apps -array

echo ""
echo $GREEN"Setting dock icon size"$RESET
defaults write com.apple.dock tilesize -int 24

# Spaces

echo ""
echo $GREEN"Disabling re-ordering of spaces"$RESET
defaults write com.apple.dock mru-spaces -bool false

echo ""
echo $GREEN"Installing Homebrew and brew cask"$RESET
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &&
brew tap caskroom/cask &&

echo ""
echo $GREEN"Installing Node.js and Yarn"$RESET
brew install yarn

echo ""
echo $GREEN"Installing global Node modules packages"$RESET
yarn global add eslint sass-lint

echo ""
echo $GREEN"Installing Spectacle and setting up shortcuts"$RESET
brew cask install spectacle
cp -r ./spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null

echo ""
echo $GREEN"Installing VSCode"$RESET
brew cask install visual-studio-code

echo ""
echo $GREEN"Installing Hyper"$RESET
brew cask install hyper

echo ""
echo $GREEN"Installing VLC"$RESET
brew cask install vlc

echo ""
echo $GREEN"Installing Lacona"$RESET
brew cask install lacona

echo ""
echo $GREEN"Installing 1password"$RESET
brew cask install 1password

echo ""
echo $GREEN"Installing Chrome"$RESET
brew cask install google-chrome

echo ""
echo $GREEN"Installing Firefox"$RESET
brew cask install firefox

echo ""
echo $GREEN"Installing Slack"$RESET
brew cask install slack

echo ""
echo $GREEN"Installing Spotify"$RESET
brew cask install spotify

echo ""
echo $GREEN""$RESET