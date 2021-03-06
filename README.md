# Netexplore : Deploy your own Internet to learn TCP/IP by practical

Netexplore uses containers to deploy an internet-like environment in order to teach the fundamentals of the Internet.

This project is mainly inspired by :
 * https://www.marionnet.org
 * https://github.com/flesueur/mi-lxc

## Installation

### Packages

Installation of some packages on your host system : \
`sudo apt install lxc bridge-utils python3-lxc python3-graphviz`

### Networking

Use debian lxc-net :
 * https://wiki.debian.org/fr/LXC/SimpleBridge
 * https://debian-facile.org/doc:reseau:vm:lxc-net

#### OR

Create a bridge for the internet connection : \
`sudo brctl addbr lxcbr0` \
Then add your internet interface to that bridge : \
`sudo brctl addif lxcbr0 enp2s0`

## How to use

All the base templates are in the `templates` directory. You can extend it by adding some directories. \
You need to create a project directory or use an example project in the `examples` directory.

Deploy your first networks : \
`sudo ./netexplore start examples/basic-layer3`
