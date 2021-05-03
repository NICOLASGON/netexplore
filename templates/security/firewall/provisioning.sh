#!/bin/bash

apk update
apk add iptables

# Deny all traffic
iptables --policy INPUT DROP
iptables --policy OUTPUT DROP
iptables --policy FORWARD DROP