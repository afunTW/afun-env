# setting vim vundle
sudo apt-get update
sudo apt-get install vim
cp -r .vim ~/
cp .vimrc ~/
vim +PluginInstall +qall

# setting powerline
sudo apt-get install git
git clone https://github.com/powerline/fonts ~/.font
~/.font/install.sh
