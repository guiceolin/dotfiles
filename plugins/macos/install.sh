#!/bin/sh

###### Fix Keyboard ( https://ppolyzos.com/2020/10/09/swap-places-between-tilde-and-section-sign-%C2%A7-key-in-your-macbook-keyboard/ ) 
cat << 'EOF' > ~/.tilde-switch && chmod +x ~/.tilde-switch
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064},{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035}]}'
EOF

sudo /usr/bin/env bash -c "cat > /Library/LaunchAgents/org.custom.tilde-switch.plist" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>org.custom.tilde-switch</string>
    <key>Program</key>
    <string>${HOME}/.tilde-switch</string>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <false/>
  </dict>
</plist>
EOF

sudo launchctl load -w -- /Library/LaunchAgents/org.custom.tilde-switch.plist 


# # ~/.macos — https://mths.be/macos
# 
# # Ask for the administrator password upfront
# sudo -v
# 
# ###############################################################################
# # System Menu                                                                 #
# ###############################################################################
# 
# # Show menu icons
# defaults write com.apple.systemuiserver menuExtras -array \
#         "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
#         "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
#         "/System/Library/CoreServices/Menu Extras/Volume.menu" \
#         "/System/Library/CoreServices/Menu Extras/Battery.menu" \
#         "/System/Library/CoreServices/Menu Extras/Clock.menu"
# 
# # Show percent on battery status
# defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# 
###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 2
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 2

# Enable 3-finger drag. (Moving with 3 fingers in any window "chrome" moves the window.)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true


# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

# set shorter repeat start time
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en" "pt"
defaults write NSGlobalDomain AppleLocale -string "pt_BR@currency=BRL"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "America/Sao_Paulo" > /dev/null

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# 
# ###############################################################################
# # Screen                                                                      #
# ###############################################################################
# 
# # Require password immediately after sleep or screen saver begins
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 0
# 
# # Save screenshots to the desktop
# defaults write com.apple.screencapture location -string "${HOME}/Desktop"
# 
# # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
# defaults write com.apple.screencapture type -string "png"
# 
# # Disable shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool true
# 
# # Enable subpixel font rendering on non-Apple LCDs
# defaults write NSGlobalDomain AppleFontSmoothing -int 2
# 
# # Enable HiDPI display modes (requires restart)
# sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
# 
# 
# ###############################################################################
# # Finder                                                                      #
# ###############################################################################
# 
# # Set Desktop as the default location for new Finder windows
# # For other paths, use `PfLo` and `file:///full/path/here/`
# defaults write com.apple.finder NewWindowTarget -string "PfDe"
# defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"
# 
# # Finder: show all filename extensions
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# 
# # Finder: show status bar
# defaults write com.apple.finder ShowStatusBar -bool true
# 
# # Finder: show path bar
# defaults write com.apple.finder ShowPathbar -bool true
# 
# # Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# 
# # When performing a search, search the current folder by default
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# 
# # Disable the warning when changing a file extension
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# 
# # Avoid creating .DS_Store files on network volumes
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# 
# # Automatically open a new Finder window when a volume is mounted
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
# 
# # Show the ~/Library folder
# chflags nohidden ~/Library
# 
# # Show the /Volumes folder
# sudo chflags nohidden /Volumes
# 
# # Enable spring loading for directories
# defaults write NSGlobalDomain com.apple.springing.enabled -bool true
# 
# # Remove the spring loading delay for directories
# defaults write NSGlobalDomain com.apple.springing.delay -float 0.1
# 
# # Enable AirDrop over Ethernet and on unsupported Macs running Lion
# defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
# 
# # Change minimize/maximize window effect
# defaults write com.apple.dock mineffect -string "scale"
# 
# # Minimize windows into their application’s icon
# defaults write com.apple.dock minimize-to-application -bool true
# 
# # Enable spring loading for all Dock items
# defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
# 
# # Show indicator lights for open applications in the Dock
# defaults write com.apple.dock show-process-indicators -bool true
# 
# # Magnification
# defaults write com.apple.dock magnification -bool true
# 
# # Don’t group windows by application in Mission Control
# # (i.e. use the old Exposé behavior instead)
# defaults write com.apple.dock expose-group-by-app -bool false
# 
# # Disable Dashboard
# defaults write com.apple.dashboard mcx-disabled -bool true
# 
# # Don’t show Dashboard as a Space
# defaults write com.apple.dock dashboard-in-overlay -bool true
# 
# # Don’t automatically rearrange Spaces based on most recent use
# defaults write com.apple.dock mru-spaces -bool false
# 
# # Remove the auto-hiding Dock delay
# defaults write com.apple.dock autohide-delay -float 0
# # Remove the animation when hiding/showing the Dock
# # defaults write com.apple.dock autohide-time-modifier -float 0
# 
# # Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool true
# 
# # Make Dock icons of hidden applications translucent
# defaults write com.apple.dock showhidden -bool true
# 
# # Ask for restart
# # for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
# # 	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
# # 	"Opera" "Photos" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
# # 	"Transmission" "Tweetbot" "Twitter" "iCal"; do
# # 	killall "${app}" &> /dev/null
# # done
