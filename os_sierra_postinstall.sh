#!/bin/bash
# ------------------------------------------------
# OS X Sierra Postinstallation and customisation
# sep 2016
# ------------------------------------------------

function homebrew_install {
  # Install homebew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  # Homebrew asks for xcode tools

  # check for errors
  brew doctor
}

function homebrew_base_packages {
  brew install bash bash-completion ruby python openssl tree wget
}

function homebrew_post_install {
  echo "export PATH=\"/usr/local/bin:/usr/local/opt/ruby/bin\":${PATH}" >> ~/.bash_profile
  echo "export PS1='\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[01;34m\] \w \$\[\033[00m\] '" >> ~/.bash_profile
  echo "if [ -f `brew --prefix`/etc/bash_completion ]; then . `brew --prefix`/etc/bash_completion; fi" >> ~/.bash_profile
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

homebrew_install
homebrew_base_packages
homebrew_post_install
