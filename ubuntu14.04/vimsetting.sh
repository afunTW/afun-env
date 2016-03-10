# setting vim vundle
rm -rf ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp vundle.vim vundle.vim.tmp
cat ~/.vimrc >> vundle.vim.tmp
mv vundle.vim.tmp ~/.vimrc
vim +PluginInstall +qall
