BIN_DIR=$(HOME)/.local/bin
CONFIG_DIR=$(HOME)/.config

nvim: .install_nvim
	cp -r ./config/nvim $(CONFIG_DIR)/nvim

.install_nvim: .env
	wget -O $(BIN_DIR)/nvim 'https://github.com/neovim/neovim/releases/download/stable/nvim.appimage'
	chmod u+x $(BIN_DIR)/nvim

.env:
	mkdir -p $(BIN_DIR)
	mkdir -p $(CONFIG_DIR)
