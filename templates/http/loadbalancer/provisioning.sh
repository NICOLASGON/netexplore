#!/bin/bash

apk update
apk add haproxy
/etc/init.d/haproxy start

