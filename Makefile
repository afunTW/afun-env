CONFIG_DIR=$(HOME)/.config

nvim: .make_dirs
	cp -r ./config/nvim $(CONFIG_DIR)/nvim

.make_dirs:
	mkdir -p $(CONFIG_DIR)
