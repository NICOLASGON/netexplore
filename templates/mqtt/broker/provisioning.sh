#!/bin/bash

apk update
apk add mosquitto
/etc/init.d/mosquitto start