#!/bin/bash

# 請先輸入您的相關參數，不要輸入錯誤了！
EXTIF="eth0"           # 這個是可以連上 Public IP 的網路介面
RULE_PATH="/etc/iptables"	#iptables的設定路徑，最後不要有「/」
export EXTIF RULE_PATH

# 第一部份，針對本機的防火牆設定！##########################################
# 1. 先設定好核心的網路功能：

# 防止SYN Flloding的DoS攻擊
echo "1" > /proc/sys/net/ipv4/tcp_syncookies

# 防止ping的Dos攻擊
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

#rp_fileter：啟動逆向路徑過濾（Reverse Path Filtering）
#log_martians：記錄不合法的IP來源到/var/log/meesages
for i in /proc/sys/net/ipv4/conf/*/{rp_filter,log_martians}; do
  echo "1" > $i
done

# 以下建議關閉
# accept_source_route：來源路由
# accept_redirects：IP相同時採用最短路徑
# send_redirects：與前者類似，發送ICMP redirect封包
for i in /proc/sys/net/ipv4/conf/*/{,accept_source_route,accept_redirects,send_redirects}; do
  if [ -f $i ]; then
    echo "0" > $i
  fi
done

# 2. 清除規則、設定預設政策及開放 lo 與相關的設定值
PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/sbin:/usr/local/bin; export PATH
iptables -F
iptables -X
iptables -Z
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

#接受lo本機介面網路卡
iptables -A INPUT -i lo -j ACCEPT

#接受由本機發出的回應封包
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# 3. 啟動額外的防火牆 script 模組
if [ -f $RULE_PATH/iptables.deny ]; then
  sh $RULE_PATH/iptables.deny
fi

if [ -f $RULE_PATH/iptables.allow ]; then
  sh $RULE_PATH/iptables.allow
fi

# 4. 允許某些類型的 ICMP 封包進入
# 詳細請參考ICMP協定 http://linux.vbird.org/linux_server/0110network_basic.php#tcpip_network_icmp
AICMP="0 3 3/4 4 11 12 14 16 18"
for tyicmp in $AICMP
do
  iptables -A INPUT -i $EXTIF -p icmp --icmp-type $tyicmp -j ACCEPT
done

# 5. 允許某些服務的進入，請依照你自己的環境開啟
if [ -f $RULE_PATH/iptables.service ]; then
  sh $RULE_PATH/iptables.service
fi

# 6. 最終將這些功能儲存下來吧！
/etc/init.d/iptables-persistent save
