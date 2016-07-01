# setting vim vundle
cp -r .vim ~/
cp .vimrc ~/
vim +PluginInstall +qall

# setting powerline
sudo apt-get install git
git clone https://github.com/powerline/fonts ~/
./.fonts/install.sh
