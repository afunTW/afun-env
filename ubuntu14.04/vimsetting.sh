# setting vim vundle
rm -rf ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp vundle.vim ~/.vimrc
vim +PluginInstall +qall
