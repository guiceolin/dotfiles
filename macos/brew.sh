#!/usr/bin/env bash

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#
# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# install zsh
brew install zsh
brew tap homebrew/versions
brew install zsh-completions

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

brew install binutils
brew install socat
brew install ack
brew install git
brew install lua
brew install terminal-notifier
brew install the_silver_searcher
brew install tig
brew install readline

brew install vim --override-system-vi

# Brew cask
brew tap caskroom/cask

brew cask install iterm2
brew cask install google-chrome
brew cask install pritunl
brew cask install slack
brew cask install kitematic
brew cask install docker
brew cask install zeplin

# Remove outdated versions from the cellar.
brew cleanup
