BASH := /bin/bash

BIN_DIR := $(HOME)/.local/bin
FONT_DIR := $(HOME)/.fonts
CONFIG_DIR := $(HOME)/.config

TARGET_FONTS := Hack FiraCode

.env:
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(FONT_DIR)
	@mkdir -p $(CONFIG_DIR)

.install_font: .env
	@sudo apt install -y font-manager
	@for font in $(TARGET_FONTS); do \
		if [ ! -e $(FONT_DIR)/"$$font" ]; then \
			wget -O $(FONT_DIR)/"$$font.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$$font.zip"; \
			unzip $(FONT_DIR)/"$$font.zip" -d $(FONT_DIR)/"$$font"; \
			rm $(FONT_DIR)/"$$font.zip"; \
		fi \
	done
	@fc-cache -fv

.install_nvim: .env .install_font
	@if [ ! -e $(BIN_DIR)/nvim ]; then \
		@wget -O $(BIN_DIR)/nvim 'https://github.com/neovim/neovim/releases/download/stable/nvim.appimage'; \
		@chmod u+x $(BIN_DIR)/nvim; \
	fi

nvim: .install_nvim
	@cp -r ./config/nvim $(CONFIG_DIR)/nvim

keyboard_patch:
	@$(BASH) ./scripts/fixed_keychron2.sh

all: nvim

main: nvim

install: main
