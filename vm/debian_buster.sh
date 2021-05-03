#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y git lxc bridge-utils python3-lxc
sudo pip3 install graphviz

cd ~
git clone https://github.com/NICOLASGON/netexplore.git

cat > /etc/default/lxc-net << EOL
USE_LXC_BRIDGE="true"
EOL

cat > /etc/lxc/default.conf << EOL
lxc.net[0].type = veth
lxc.net[0].link = lxcbr0
lxc.net[0].flags = up
EOL

sudo service lxc-net start