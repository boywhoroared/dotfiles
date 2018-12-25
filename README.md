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
stow $(pwd) -t $HOME bash
stow $(pwd) -t $HOME sh
stow $(pwd) -t $HOME tmux
stow $(pwd) -t $HOME keyboard
stow $(pwd) -t $HOME git
```
