# OSX Sierra Postinstall Script
A script to easy and automate the post-installation phase and customization of OS X Sierra 10.12
## Installation
Checkout the code locally and run it
### Prerequisities
```
OSX Sierra 10.12 (tested)
```
## Usage
Review the code (make sure it does what you're expecting)
Configure the DEVICE_NAME variable (Computername)
./os_sierra_postinstall.sh
## Features
* [Homebrew](http://brew.sh/index.html) Installation
* Homebrew base packages: bash bash-completion ruby python openssl tree wget
* Bash customization
* OS X gatekeeper configuration
* [Cask](https://caskroom.github.io) installation & configuration
* Cask base application: atom flux google-chrome spotify vlc
* [Mac App Store Command-line (MAS)](https://github.com/mas-cli/mas) Installation
* MAS base applications: Pixelmator, Pages, Keynote, Numbers
* Fonts installation
* OSX User Inputs Devices configruation: UNnatural scroll & tap to click (trackpad)
* OSX Finder configuration
* OSX Terminal theme configuration
* [Lock Screen Application](https://github.com/gaomd/lock-screen-app) compilation & installation
