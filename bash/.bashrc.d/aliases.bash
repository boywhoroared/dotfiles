# console
v() {
  $VISUAL "$@"
}

l() {
  ls -f
}

ll() {
  ls -aAplhF
}

lh() {
  ls -Alh
}

# only list directories
ld() {
  ls -lF | grep '^d'
}

filesize () {
  du -sh
}

h() {
  history 
}

# find a command in history
h?() {
  history | grep "$@"
}

# edit a command from history. (I always forget fc)
he() {
  fc "$@"
}

g() {
  git "$@"
}

k() {
  kubectl "$@"
}

kns() {
  kubens "$@"
}

ktx() {
  kubectx "$@"
}

# Include custom aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local
