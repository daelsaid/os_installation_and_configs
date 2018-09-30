#MAIN SCRIPT PULLED FROM: 
#https://gist.github.com/bradp/bea76b16d3325f5c47d4

# setting up new computer
#
# 1. install istat and enter license key
#     1. https://bjango.com/mac/istatmenus/
#     2. registration license number:
# 2. install spectacle
#     1. https://www.spectacleapp.com
# 3. install resolutionator
#     1. https://manytricks.com/resolutionator/releasenotes/
# 4. install disk inventory x
#     1. http://www.derlien.com
# 5. install super duper
#     1. https://www.shirt-pocket.com/SuperDuper/
# 6. download item
#     1. https://iterm2.com/downloads.html
# 7. download app cleanrer
#     1. http://freemacsoft.net/appcleaner/
# 8. Interact
#     1. https://nteract.io/desktop
#     2. Need config for bash and python

#EDIT APPLICATIONS HERE:
#COMMENT OUT WHAT U DONT WANT

apps=(
  alfred
  appcleaner
  atom
  spectacle
  resolutionator
  diffmerge
  iterm2
  google-chrome
  istat-menus
  vagrant
  sublime-text2
  vlc
  vnc-server
  vnc-viewer
  skype
)

commandline_apps=(
  tree
  wget
  trash
  svn
  docker
  node
)

git_user=""
git_email=""


echo "Creating an SSH key for you..."
ssh-keygen -t rsa

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"

git config --global user.name ${git_user}
git config --global user.email ${git_email}

 # Update homebrew recipes
echo "Updating homebrew..."
brew update;

echo "Installing brew git utilities..."
brew install git-extras
brew install git-flow

echo "Installing other brew stuff..."
brew install ${commandline_apps[@]}

echo "Cleaning up brew"
brew cleanup;

#@TODO install our custom fonts and stuff

echo "Cleaning up brew"
brew cleanup

echo -e "=> Installing brew cask if not already"
brew install caskroom/cask/brew-cask

# Apps defined above
# Install apps using brew cask to /Applications

echo "installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}
brew cask alfred link

#remove unecessary files
brew cleanup


echo "Setting some Mac settings..."
#path=~/Library/Preferences

#"Disabling system-wide resume"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

#"Disabling automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

#"Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

#"Disabling OS X Gate Keeper"
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

#"Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

#"Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#"Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool true

#"Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

#"Disable smart quotes and smart dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#"Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#”Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

#"Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

#"Showing icons for external hard drives and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

#"Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool false

#"Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#"Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

#"Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#"Enabling snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

#"Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

#"Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

#"Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

#"Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

#"Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#"Disable the sudden motion sensor as its not useful for SSDs"
sudo pmset -a sms 0

#"Speeding up wake from sleep to 24 hours from an hour"
sudo pmset -a standbydelay 86400

#"Setting screenshots location to ~/Documents/screenshots“
defaults write com.apple.screencapture location -string "${HOME}/Documents/screenshots"

#Setting screenshot format to PNG
defaults write com.apple.screencapture type -string "png"

#Hiding Safaris bookmarks bar by default;
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Hiding Safaris sidebar in Top Sites;
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

#Disabling Safaris thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

#Enabling Safaris debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

#Making Safari's search banners default to Contains instead of Starts Wit
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

#Removing useless icons from Safaris bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

#Allow hitting the Backspace key to go to the previous page in history"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

#"Use `~/Downloads/incomplete` to store incomplete downloads"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/incomplete";

echo "allow alfred and spectacle location access"
open spectacle;

killall Finder


echo "Done!"

￼
