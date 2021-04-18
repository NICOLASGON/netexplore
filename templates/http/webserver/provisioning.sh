#!/bin/bash

apk update
apk add nginx
/etc/init.d/nginx start
