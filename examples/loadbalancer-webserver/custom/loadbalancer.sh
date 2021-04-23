#!/bin/bash

cat > /etc/haproxy/haproxy.cfg << EOL
global
    log         127.0.0.1 local2

    chroot      /var/lib/haproxy
    pidfile     /var/run/haproxy.pid
    maxconn     4000
    user        haproxy
    group       haproxy
    daemon

    stats socket /var/lib/haproxy/stats

defaults
    mode                    http
    log                     global
    option                  httplog
    option                  dontlognull
    option http-server-close
    option forwardfor       except 127.0.0.0/8
    option                  redispatch
    retries                 3
    timeout http-request    10s
    timeout queue           1m
    timeout connect         10s
    timeout client          1m
    timeout server          1m
    timeout http-keep-alive 10s
    timeout check           10s
    maxconn                 3000

frontend main
    bind *:80
    default_backend             app

backend app
    balance     roundrobin
    server  webserver1 10.0.1.2:80 check
    server  webserver2 10.0.1.3:80 check
EOL

/etc/init.d/haproxy restart