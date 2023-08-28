#!/bin/zsh

PYTHON_VERSION=11

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# clone dotfiles from github
URL=https://github.com/tenacke/dotfiles.git

cd ~
git clone --bare $URL 

rm -rf .git
rm  LICENSE
rm README.md

git config --global user.name "tenacke"
git config --global user.email "emrekilic1010@gmail.com"

# install homebrew
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# get updated brew
brew update

# upgrade brew packages
brew upgrade

# install python3
brew install python@3.7
brew install python@3.8
brew install python@3.9
brew install python@3.10
brew install python@3.11
brew install ipython

# configure python3
sudo rm /opt/homebrew/bin/python3
sudo rm /opt/homebrew/bin/pip3
sudo rm /opt/homebrew/bin/python3-config

sudo ln -s /opt/homebrew/bin/python3.$PYTHON_VERSION /usr/local/bin/python3
sudo ln -s /opt/homebrew/bin/pip3.$PYTHON_VERSION /usr/local/bin/pip3
sudo ln -s /opt/homebrew/bin/python3.$PYTHON_VERSION-config /usr/local/bin/python3-config

# install pip packages
pip3 install --upgrade pip
./pip.sh

# install brew packages
./brew.sh

# edit /etc/paths
PATHS=$(cat /etc/paths)
NEW_PATHS="/opt/homebrew/opt/coreutils/libexec/gnubin\n/opt/homebrew/opt/findutils/libexec/gnubin\n/opt/homebrew/opt/grep/libexec/gnubin\n/opt/homebrew/opt/binutils/bin\n/opt/homebrew/opt/llvm/bin"

echo $PATHS $NEW_PATHS | tr ' ' '\n' | uniq | tr '\n' ' ' | sudo tee /etc/paths

# flush changes
exec $SHELL -l

echo "Done. Note that some of these changes require a logout/restart to take effect."
