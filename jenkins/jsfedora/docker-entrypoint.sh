#!/bin/bash

rm -f /run/nologin

# Launching open-ssh server
/usr/sbin/sshd -D
