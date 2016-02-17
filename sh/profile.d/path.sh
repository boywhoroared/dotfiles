# HomeBrew
PATH="/usr/local/sbin:$PATH"

# Node
PATH="$HOME/.node/bin:$PATH"

# Go
export GOPATH=$HOME/.golang
export GOROOT=/usr/local/opt/go/libexec
PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# Python PIP
# Install packages using: `pip install --user PACKAGE`
PATH="$PATH:$HOME/Library/Python/2.7/bin"

# Local executables
PATH="$HOME/.local/bin:$HOME/.bin:$PATH"

export PATH
