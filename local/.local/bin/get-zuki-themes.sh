git clone https://github.com/lassekongo83/zuki-themes.git || (cd zuki-themes ; git pull)
cd zuki-themes
meson build
sudo ninja -C build install
