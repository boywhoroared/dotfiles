# Dots

## Requirements

* [GNU Stow](https://www.gnu.org/software/stow/)

## Installation

```

# Install Stow
sudo apt install stow

# Get dots
git clone git@github.com:boywhoroared/dotfiles.git 


# Install dots packages to $HOME
cd dotfiles
stow -t $HOME bash
stow -t $HOME sh
stow -t $HOME tmux
stow -t $HOME keyboard
stow -t $HOME git
```
