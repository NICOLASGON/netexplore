# Netexplore : Deploy your own Internet to learn TCP/IP by practical

Netexplore uses containers to deploy an internet-like environment in order to teach the fundamentals of the Internet.

This project is mainly inspired by :
 * https://www.marionnet.org
 * https://github.com/flesueur/mi-lxc

## Installation

Installation of some packages on your host system :
`apt install lxc bridge-utils`
`sudo pip3 install pylxc graphviz` 

Use debian lxc-net : 
https://wiki.debian.org/fr/LXC/SimpleBridge
https://debian-facile.org/doc:reseau:vm:lxc-net

Create a bridge for the internet connection :
`sudo brctl addbr lxcbr0`
Then add your internet interface to that bridge :
`sudo brctl addif lxcbr0 enp2s0`

## How to use

All the base templates are in the `templates` directory. You can extend it by adding some directories.
You need to create a project directory or use an example project in the `examples` directory.

Deploy your first networks :
`./netexplore start examples/basic-layer3`
