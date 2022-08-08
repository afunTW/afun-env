cd ~/
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
mkdir -p ~/.local/bin
ln -s ~/.dropbox-dist/dropboxd ~/.local/bin/dropboxd
