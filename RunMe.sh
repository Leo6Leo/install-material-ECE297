#!/bin/csh

# download the required theme from the public github repository
git clone https://github.com/nana-4/materia-theme
cd materia-theme

# download and unpack node js
wget https://nodejs.org/dist/v16.14.0/node-v16.14.0-linux-x64.tar.xz
tar -xvf node-v16.14.0-linux-x64.tar.xz

# add the unpacked node js to path
set path = (node-v16.14.0-linux-x64/bin $path)

# for convenience, unpack ninjia into node-v16.14.0-linux-x64/bin
cd node-v16.14.0-linux-x64/bin

# download ninja
wget https://github.com/ninja-build/ninja/releases/download/v1.10.2/ninja-linux.zip
unzip ninja-linux.zip
cd ../..

# install meson
pip3 install --user meson

# build it
~/.local/bin/meson _build -Dprefix="$HOME/.local"
~/.local/bin/meson install -C _build

# since the UG setup is a little weird
# move the files into the right place 
mv ~/.local/share/themes/* ~/.themes

