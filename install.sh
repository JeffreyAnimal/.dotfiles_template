#! /bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to Path

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/fabian/.profile;
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";

# Install Packages required
brew install stow neovim;

echo "Beware! In the next Step, existing dotfiles will be overwritten.\nContinue? (Y)";
read var_keyInput;

if ["$var_keyInput" != "Y"] OR ["$var_keyInput" != "y"]; then
	echo "Aborting";
	exit 0;
fi


# Stow Creating Softlinks to actual dotfiles
cd ~/.dotfiles;
stow --simulate -v . # Remove Flag if working
