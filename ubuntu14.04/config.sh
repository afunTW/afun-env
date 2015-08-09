#!/bin/bash
# Just use vim, change the format (:set fileformat=unix) and then write out (:wq) the file.

echo This script installs for clean Ubuntu14.04 locally. Updated:20150810
echo
echo This script is not fully automatic. Some manual operations are necessary.

WHOAMI=$(whoami)
if [ "root" == "$WHOAMI" ]
then
	echo The account running this script should have sudoer permission. But you should not run this script with sudo directly.
fi
read -p "Press any key to continue..." -n1 -s

echo -n ""
echo "##########"
echo "# Installing NodeJS, System Packages, Creating User and Setup Environment."
echo "##########"
echo -n ""
echo "##########"
echo "Installing system package"
sudo apt-get update
sudo apt-get -y install curl wget
curl -sL https://deb.nodesource.com/setup | sudo bash -

sudo add-apt-repository ppa:indicator-multiload/stable-daily
sudo apt-get update
for i in git nodejs mongodb make gcc ssh vim automake unzip tree aptitude indicator-multiload hime bumblebee bumblebee-nvidia primus linux-headers-generic
do
	sudo apt-get -y install $i
done

echo -n ""
echo "##########"
echo "Now you need to:"
echo "* Install the newest virtualbox and virtualbox extension pack as well"
echo "* Get the ubuntu ISO from http://ftp.ubuntu-tw.org/"
echo "* Setting up the Google Public DNS(8.8.8.8, 8.8.4.4)"
echo "* sudo gedit /etc/dhcp/dhclient.conf"
echo "* append 'prepend domain-name-servers'"
echo "* system setting > network > edit connection"
echo "* switch connection method to 'Automatic (DHCP) address only'"
echo "* DNS server: 8.8.8.8, 8.8.4.4"
