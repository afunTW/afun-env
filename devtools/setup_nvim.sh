# install
# ref https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu
sudo apt install neovim python3-neovim software-properties-common

# create the file structure
mkdir -p "$HOME/.config/nvim"
touch "$HOME/.config/nvim/init.vim"
pip3 install --user neovim

# get vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# get powerline fonts
sudo apt-get install fonts-powerline
