#!/bin/bash
# Just use vim, change the format (:set fileformat=unix) and then write out (:wq) the file.

mkdir ~/Downloads/tool
current_path=$(pwd)
cd ~/Downloads/tool

echo -n ""
echo "##########"
echo "Installing rsatool"
git clone https://github.com/ius/rsatool.git
sudo apt-get install -y python-dev
sudo apt-get install -y libgmp3-dev
sudo python rsatool/setup.py install

echo -n ""
echo "##########"
echo "Installing pkcrack"
cp current_path/pkcrack-1.2.2.tar.gz .
tar zxvf pkcrack-1.2.2.tar.gz
rm pkcrack-1.2.2.tar.gz

echo -n ""
echo "##########"
echo "Installing Hopper"
sudo echo "## Append by linux_env_config/tool" >> /etc/apt/source.list
UBUNTU_BITS_VERSION=$(uname -m)
if [ "$UBUNTU_BITS_VERSION" == "i686" ];then
  sudo echo "deb http://www.hopperapp.com/linux/i386 repo/" >> /etc/apt/source.list
else
  sudo echo "deb http://www.hopperapp.com/linux/amd64 repo/" >> /etc/apt/source.list
fi
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com E9EB04D3
sudo apt-get update
sudo apt-get install hopper
