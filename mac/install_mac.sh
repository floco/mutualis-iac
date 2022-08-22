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
/usr/sbin/softwareupdate --install-rosetta

## INSTALL SW VIA BREW
brew install \
mas \
microsoft-edge \
notion \
visual-studio-code \
xbar \
kopia \
signal \
rectangle \
sweet-home3d \
spotify \
prusaslicer \
molotov \
jump \
teamviewer \
autodesk-fusion360

## INSTALL SW VIA APP STORE
mas lucky amphetamine
mas lucky daisydisk 
mas lucky spark
mas lucky bitwarden
mas lucky amazonprimevideo
mas lucky whatsapp

## ROSETTA APPS
# autodesk-fusion360

## MANUAL STEPS
# sync vscode settings