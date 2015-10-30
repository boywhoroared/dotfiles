# Local executables
PATH="$HOME/.local/bin:$HOME/.bin:$PATH"

# Node
PATH="$HOME/.node/bin:$PATH"

# Go
export GOPATH=$HOME/.golang
export GOROOT=/usr/local/opt/go/libexec

PATH=$PATH:$GOPATH/bin
PATH=$PATH:$GOROOT/bin

export PATH
