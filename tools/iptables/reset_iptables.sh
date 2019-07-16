#!/bin/bash

# 清除iptables的所有設定，並允許所有連線
iptables -F
iptables -X
iptables -Z
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

# 儲存設定
#/etc/init.d/iptables save #先不儲存，重開機之後就會恢復之前的設定