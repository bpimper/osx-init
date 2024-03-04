#!/bin/bash
# Lists for Homebrew
tap_list=(
  homebrew/cask-fonts
)
formula_list=(
  cask
  tailscale
  zsh
  powerlevel10k
  lsd
  zsh-syntax-highlighting
)
cask_list=(
  istat-menus
  raycast
  the-unarchiver
  adobe-creative-cloud
  authy
  bitwarden
  telegram
  logitune
  spotify
  vlc
  qview
  google-chrome
  firefox
  steam
  discord
  league-of-legends
  vscodium
  iterm2
  font-hack-nerd-font
)

# Download & Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
rm -rf install.sh

# Adding taps to Homebrew
for tap in "${tap_list[@]}"
do
  brew tap "$tap"
done

# Installing formulas
for formula in "${formula_list[@]}"
do
  brew install "$formula"
done

# Installing casks
for cask in "${cask_list[@]}"
do
  brew install --cask "$cask"
done

# Set zsh for shell
sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Place .zshrc
mv ./zshrc ~/.zshrc
# Place iIerm2 config
mv ./com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

# Appstore apps
open https://apps.apple.com/us/app/dropover/id1355679052

exit