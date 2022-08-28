#!/bin/bash

# https://github.com/IulianDita/keychron/blob/master/k2.md
sudo tee /etc/udev/rules.d/80-keychron.rules > /dev/null <<EOT
SUBSYSTEMS=="input", ATTRS{name}=="Keychron K2", RUN+="echo 0 | tee /sys/module/hid_apple/parameters/fnmode"
EOT
sudo udevadm control --reload-rules && sudo udevadm trigger
