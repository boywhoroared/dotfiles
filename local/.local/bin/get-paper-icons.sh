git clone https://github.com/snwh/paper-icon-theme || (cd paper-icon-theme; git pull)
cd paper-icon-theme

# build (install to $HOME/.local/share/...)
meson "build" --prefix=$HOME/.local 
# install
sudo ninja -C "build" install
