#!/bin/bash
# ------------------------------------------------
# OS X Sierra Postinstallation and customisation
# Sep 2016
# ------------------------------------------------
#

DEVICE_NAME="iMac"
WDIR=$(pwd)


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
  # Install base cask packages
  brew cask install \
    atom \
    flux \
    google-chrome \
    spotify \
    beyond-compare \
    chrome \
    docker \
    dropbox \
    fugu \
    gimp \
    git \
    hipchat \
    iterm \
    keepassx \
    little-snitch \
    owncloud \
    path-finder \
    postman \
    pycharm \
    skype-for-business \
    sonos \
    sourcetree \
    spotify \
    sublime-text \
    vagrant \
    virtualbox \
    vmware-fusion \
    vlc
}

function mas_install {
  # Install MAS (Mac AppStore) command line tool
  brew install mas
}

function mas_base_packages {
  # Install App from the Apple AppStore
  mas install 775737590   #iA Writer
  mas install 918858936   #Airmail
  mas install 405843582   #Alfred
  mas install 408981426   #Aperture
  mas install 535436797   #Arduino
  mas install 1055511498  #Day One
  mas install 406056744   #Evernote
  mas install 1111570163  #GrandPerspective
  mas install 446366603   #ifolor Designer
  mas install 405399194   #Kindle
  mas install 973213640   #MSG Viewer for Outlook
  mas install 1142578753  #OmniGraffle
  mas install 534553406   #Skim
  mas install 425955336   #Skitch
  mas install 423368786   #Systemmonitor
  mas install 485812721   #TweetDeck
  mas install 411680127   #Wifi Scanner
  mas install 525912054   #Wifi Signal
  mas install 784801555   #OneNote
  mas install 409789998   #Twitter
  mas install 425424353   #The Unarchiver
  mas install 568494494   #Pocket
}

function install_font {
  # Install fonts
  cp ${WDIR}/fonts/*.ttf /Library/Fonts/
}

function configure_uid {
  # Disable UNnatural scroll
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

	  # Trackpad: enable tap to click for this user and for the login screen
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
}

function configure_host {
  # Set Computername
  sudo scutil --set ComputerName "$DEVICE_NAME"
  sudo scutil --set HostName "$DEVICE_NAME"
  sudo scutil --set LocalHostName "$DEVICE_NAME"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$DEVICE_NAME"
}

function configure_finder_desktop {
  # Show icons for hard drives, servers, and removable media on the desktop
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

  #Show status bar in finder
  defaults write com.apple.finder ShowStatusBar -bool true

  # Avoid creating .DS_Store files on network volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
}

function configure_terminal {
  # Sets the default Terminal THeme PRO
  defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
  defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"
}

# main programm		  
echo "Starting the install"
homebrew_base_packages
homebrew_post_install

gatekeeper

cask_install
cask_base_packages

mas_install
mas_base_packages
