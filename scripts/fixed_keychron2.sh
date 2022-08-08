#!/bin/bash

# https://github.com/adam-savard/keyboard-function-keys-linux
sudo tee -a /etc/systemd/system/keychron.service > /dev/null <<EOT
[Unit]
Description=Disables media keys for the Keychron K2 and enables function keys

[Service]
Type=oneshot
ExecStart=/bin/bash -c "echo 0 > /sys/module/hid_apple/parameters/fnmode"

[Install]
WantedBy=multi-user.target
EOT

systemctl enable keychron
systemctl start keychron
