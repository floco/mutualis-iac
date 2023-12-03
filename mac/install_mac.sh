# Install Homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/julien/.zprofile
# eval "$(/opt/homebrew/bin/brew shellenv)"

## CONFIGURATION
# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

## ROSETTA
if [ $(/usr/bin/pgrep oahd >/dev/null 2>&1;echo $?) -eq 0 ]; then echo 'Rosetta already installed'; else /usr/sbin/softwareupdate --install-rosetta; fi

## INSTALL SW VIA BREW
### UTILITIES
brew install \
mas \
xbar \
kopia \
kopiaui \
rectangle \
betterdisplay \
youtube-dl \
ffmpeg \
logitech-options \
balenaetcher \
coconutbattery \
android-file-transfer \
only-switch \
teamviewer

### PRODUCTIVITY
brew install \
signal \
microsoft-edge \
google-chrome \
firefox \
google-drive \
discord \
pdf-expert\
notion

### CODE
brew install \
pipx \
git \
hyper \
font-hack-nerd-font \
arduino \
fzf \
hyper \
pipx \
visual-studio-code

### 3D
brew install \
prusaslicer \
sweet-home3d \
openscad \
autodesk-fusion360

### MEDIA
brew install \
molotov \
stremio \
vlc \
spotify

brew install --cask openbb-terminal
brew install --cask insta360-studio

## INSTALL SW VIA APP STORE
mas lucky amphetamine
mas lucky daisydisk 
mas lucky spark
mas lucky bitwarden
mas lucky amazonprimevideo
mas lucky whatsapp
mas lucky eidreader
mas lucky newsify
mas lucky tailscale
mas lucky testflight
mas lucky mqttexplorer
mas lucky authy

## ROSETTA APPS
# autodesk-fusion360

## MANUAL STEPS
# sync vscode settings
# install eid driver, eid viewer and ACR38 car reader driver
# copy .zshrc and .ssh
# install osxphotos: pipx install osxphotos