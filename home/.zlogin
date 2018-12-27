#!/bin/bash

# Autostart X on default session
if [[ "$(tty)" == '/dev/tty1' ]]; then
  exec startx
fi
