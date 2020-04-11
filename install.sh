#!/usr/bin/env bash

echo "Setting up mac"

# install rust
if test ! $(which rustup); then
  echo Installing Rustup
  # curl https://sh.rustup.rs -sSf | sh
fi

# install homebrew

if test ! $(which brew); then
  echo Installing Homebrew
  # curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install
fi


OTHER_REPO_PATH="$HOME/repos/other"

mkdir -p $OTHER_REPO_PATH

# install scm breeze
if [ ! -d $OTHER_REPO_PATH/.scm_breeze ]; then
  echo Installing SCM Breeze
  # git clone git://github.com/scmbreeze/scm_breeze.git $OTHER_REPO_PATH/.scm_breeze
  # $OTHER_REPO_PATH/.scm_breeze/install.sh
fi

# install brew/bundle
# brew tap Homebrew/bundle


# After brew bundle
# Install useful key bindings and fuzzy completion for fzf:
$(brew --prefix)/opt/fzf/install





