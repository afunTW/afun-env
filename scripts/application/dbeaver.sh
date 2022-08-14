#!/usr/bin/bash

# Step 1 - Install java (Ubuntu 20.04/18.04/16.04)
sudo apt -y  install openjdk-11-jdk openjdk-11-jre
java --version

# Step 2 - Add Debian repository and Install DBeaver CE
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update
sudo apt -y  install dbeaver-ce
apt policy  dbeaver-ce 

# Step 3: Prepare Database Server, prepare database
# Step 4: Launching DBeaver
