#!/bin/sh

ip a add 10.0.1.2/24 dev eth1
ip r add 10.0.2.0/24 via 10.0.1.1 dev eth1