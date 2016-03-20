# setting vim vundle
rm -rf ~/.vim/
rm ~/.vimrc
# ln -s .vimrc ~/
# ln -s .vim ~/
cp -r .vim ~/
cp .vimrc ~/
vim +PluginInstall +qall

# setting powerline
cp -r .fonts ~/	
fc-cache -vf ~/.fonts/
cp -r conf.d/ ~/.config/fontconfig/
