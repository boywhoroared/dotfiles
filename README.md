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
stow -d $(pwd) -t $HOME bash
stow -d $(pwd) -t $HOME sh
stow -d $(pwd) -t $HOME tmux
```
