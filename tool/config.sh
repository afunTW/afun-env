#!/bin/bash
# Just use vim, change the format (:set fileformat=unix) and then write out (:wq) the file.

mkdir ~/Downloads/tool
current_path=$(pwd)
cd ~/Downloads/tool

echo -n ""
echo "##########"
echo "Installing rsatool"
git clone https://github.com/ius/rsatool.git
python rsatool/setup.py

echo -n ""
echo "##########"
echo "Installing pkcrack"
cp current_path/pkcrack-1.2.2.tar.gz .
tar zxvf pkcrack-1.2.2.tar.gz
rm pkcrack-1.2.2.tar.gz
