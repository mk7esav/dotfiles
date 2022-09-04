############################################################################################# 
# Starship shell
# ==================================================
# curl -sS https://starship.rs/install.sh | sh
# Pre-requesite is an Nerd Font in your terminal
#
# Configurations:
# mkdir -p ~/.config && touch ~/.config/starship.toml
# https://starship.rs/config/
#--------------------------------------------------------------------------------------------
# Autocompletion for zshell
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
#--------------------------------------------------------------------------------------------
#
# Custom shell scripts
# jsonf - for formatting JSON
# vpn - office vpn 
# movejar - for WR local
#
#--------------------------------------------------------------------------------------------
# Cargo, ripgrep
# ===================================================
# Install cargo before configuring other tools
# sudo apt install cargo
# sudo apt install ripgrep
# cargo install bat
#
#--------------------------------------------------------------------------------------------
#
# exa 
# https://ourcodeworld.com/articles/read/832/how-to-install-and-use-exa-a-modern-replacement-for-the-ls-command-in-ubuntu-16-04
#
#--------------------------------------------------------------------------------------------
#
# JSON prettifier
# ==========================
# sudo apt install jq
# sudo apt install moreutils (for sponge)
# jq . file.json | sponge file.json
# Write an script to do the thing - jsonf
#--------------------------------------------------------------------------------------------
# Zoxide
# ==========================
# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
#
#
#
# Fuzzy Finder 
# ==========================
# sudo apt install fzf
# needs neovim - sudo apt install neovim
# alias finder="fzf --margin 10% --border --reverse --prompt='$ ' | xargs lvim"
# export FZF_DEFAULT_COMMAND="find -L" # For looking at the hidden files
#
#
#
# https://zaiste.net/posts/shell-commands-rust/
# procs, tealdeer, delta, grex
# cargo install procs
# cargo install tealdeer
#       tealdeer is a very fast implementation of tldr, a command-line program for displaying simplified, example based and community-driven man pages.


# ===== Delta ======
# https://dandavison.github.io/delta/installation.html
# https://github.com/dandavison/delta/releases
# The best thing -- 
# configuration can be done in the ~/.gitconfig file 


# DIFF TO HTML
# =================
# sudo npm install -g diff2html
#
#
# SQL Formatter
# npm i -g sql-formatter-cli
#
# Zathura
# sudo apt install zathura
############################################################################################# 

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export SCRIPTS=$HOME/.local/bin
export CARGO=$HOME/.cargo/bin
export JAVA_HOME=/opt/OracleJava
export ANT_HOME=/opt/ANT
export PATH=$PATH:$CARGO:$SCRIPTS:$JAVA_HOME/bin:$ANT_HOME/bin


alias rl='source ~/.zshrc'
alias ll='exa --long --header --icons -b'
alias ls='exa --icons'
alias tree='exa --tree --icons'
alias dir='exa -D --header -l '
alias ct='bat '
alias finder="fzf --no-clear --margin 5% --color bg:#353E42 --reverse | xargs lvim"
alias fzf='fzf --margin 5% --color bg:#353E42 --reverse'
alias diffhtml='diff2html -i file -- '
alias sqlf='sql-formatter-cli --file '
alias tmux='tmux -u '
alias v='nvim'
alias pdf='zathura'
alias ..='cd ..'
alias mc='mc --nocolor'
alias apt='sudo nala'
alias mkdir='mkdir -p '
alias rmdir='rm -r '
