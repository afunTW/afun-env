# setting vim vundle
rm -rf ~/.vim/
ln -s .vim ~/.vim
ln -s .vimrc ~/.vimrc
vim +PluginInstall +qall

# setting powerline
cp -r .font ~/	
fc-cache -vf ~/.fonts/
cp -r .config/fontconfig/conf.d/ ~/.config/fontconfig/conf.d/
