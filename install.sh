# !/bin/bash
# Downloading packages 

# Basic
sudo apt install jq cargo ripgrep moreutils fzf tmux zathura curl zsh neovim

# Still you need nodejs and npm installed on your system
sudo npm install -g diff2html sql-formatter-cli

# Terminal prompt 
curl -sS https://starship.rs/install.sh | sh
curl -sS https://webinstall.dev/zoxide | bash

# Auto completion for zshell
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Cargo packages
cargo install bat 
cargo install exa

# Moving the folders to required places
# I don't want to mess with your directory structure. 
# you take care of it
