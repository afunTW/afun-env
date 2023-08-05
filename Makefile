LOCAL_BIN=$(HOME)/.local/bin
CONFIG_DIR=$(HOME)/.config

nvim: .install_nvim
	cp -r ./config/nvim $(CONFIG_DIR)/nvim

.install_nvim: .env
	wget -O $(LOCAL_BIN)/nvim 'https://github.com/neovim/neovim/releases/download/stable/nvim.appimage'
	chmod u+x $(LOCAL_BIN)/nvim

.env:
	mkdir -p $(LOCAL_BIN)
	mkdir -p $(CONFIG_DIR)
