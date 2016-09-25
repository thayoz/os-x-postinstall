#!/bin/bash
# ------------------------------------------------
# OS X Sierra Postinstallation and customisation
# thayoz sep 2016
# ------------------------------------------------

function homebrew_install {
  # Install homebew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  # Homebrew asks for xcode tools

  # check for errors
  brew doctor
  exit
}

function homebrew_base_packages {
  brew install bash bash-completion ruby python openssl tree wget
}

function gatekeeper {
  #Set the gatekeeper status to allow installation from apps outside of the appstore
  sudo spctl --master-disable
}

function cask_install {
  #Install Cask
  brew tap caskroom/cask
  #Set /Application as default target directory for apps
  echo "export HOMEBREW_CASK_OPTS=\"--appdir=/Applications\"" >> ~/.bash_profile
}

function cask_base_packages {
  brew cask install atom google-chrome spotify pixelmator vlc
}

function mas_install {
  brew install mas
}

function mas_base_packages {
  mas install 407963104 #Pixelmator
  mas install 409201541 #Pages
  mas install 409183694 #Keynote
  mas install 409203825 #Numbers
}
