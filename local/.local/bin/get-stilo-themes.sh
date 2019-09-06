git clone https://github.com/lassekongo83/stilo-themes.git || (cd stilo-themes ; git pull)
cd stilo-themes
meson build
sudo ninja -C build install
