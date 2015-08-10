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
echo "Bind the github account"
read -p "Please enter your github user email: " GITHUB_EMAIL
read -p "Please enter your github user name: " GITHUB_NAME
git config --global user.email "$GITHUB_EMAIL"
git config --global user.name "$GITHUB_NAME"
git config --global credential.helper "cache --timeout=3600000"

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
echo "Setting up the Google public DNS"
if [ "cat /etc/dhcp/dhclient.conf | grep -E 'prepend domain-name-servers ([8]{1}\.){2}([48]\.)([48])' | wc -l" == "1" ];then
	sudo sed -i '/#prepend domain-name-servers/a prepend domain-name-servers 8.8.8.8, 8.8.4.4' /etc/dhcp/dhclient.conf
fi

echo -n ""
echo "##########"
echo "Build the workspace"
mkdir ~/Documents/project

echo -n ""
echo "##########"
echo "Instaling easy_install and pip"
python ez_setup.py
easy_install pip

echo -n ""
echo "##########"
echo "Installing Rust(1.2.0) and cargo"
curl -sSf https://static.rust-lang.org/rustup.sh | sh
mkdir ~/Documents/project/rust
current_path=$(pwd)
cd ~/Documents/project/rust
git clone https://github.com/rust-lang/cargo
cd current_path

echo -n ""
echo "##########"
echo "Installing IDE, Messenger(Telegram)"
sudo add-apt-repository ppa:webupd8team/atom
sudo add-apt-repository ppa:atareao/telegram
sudo apt-get update
for i in atom telegram
do
	sudo apt-get -y install i
done
apm install language-rust
sudo mv Telegram /opt

echo -n ""
echo "##########"
echo "Installing dropbox"
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

echo -n ""
echo "##########"
echo "Now you need to:"
echo "* Install the newest virtualbox and virtualbox extension pack as well"
echo "* Get the ubuntu ISO from http://ftp.ubuntu-tw.org/"
echo "* Recommended to set google public dns server on the network connection"
echo "* system setting > network > edit connection"
echo "* switch connection method to 'Automatic (DHCP) address only'"
echo "* DNS server: 8.8.8.8, 8.8.4.4"
