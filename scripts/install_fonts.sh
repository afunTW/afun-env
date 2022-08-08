#!/bin/bash

sudo apt install -y font-manager

FONTS_FIRACODE=(
	'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf'
	'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete%20Mono.ttf'
	'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf'
	'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete.ttf'
)
FONTS_HACK=(
	'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf'
	'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf'
	'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf'
	'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf'
)

download_fonts() {
	local FONTS=($@)
	for font in "${FONTS[@]}";do
		name="$(basename ${font//\%20/\_})"
		curl -fLo $name $font
	done
}

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
download_fonts ${FONTS_FIRACODE[@]}
download_fonts ${FONTS_HACK[@]}
fc-cache -f -v
