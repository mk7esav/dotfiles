# Reloading the config files
alias rl='source ~/.zshrc'

# Starship shell
# ==================================================
# curl -sS https://starship.rs/install.sh | sh
# Pre-requesite is an Nerd Font in your terminal
#
# Configurations:
# mkdir -p ~/.config && touch ~/.config/starship.toml
# https://starship.rs/config/
eval "$(starship init zsh)"

# Autocompletion for zshell
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Custom shell scripts
# jsonf - for formatting JSON
# vpn - office vpn 
# movejar - for WR local
export SCRIPTS=$HOME/.local/bin

# Cargo, ripgrep
# ===================================================
# Install cargo before configuring other tools
# sudo apt install cargo
# sudo apt install ripgrep
export CARGO=$HOME/.cargo/bin
export PATH=$PATH:$CARGO:$SCRIPTS

# exa 
# ------------------
# https://ourcodeworld.com/articles/read/832/how-to-install-and-use-exa-a-modern-replacement-for-the-ls-command-in-ubuntu-16-04
alias ll='exa --long --header --icons -b'
alias ls='exa --icons'
alias tree='exa --tree --icons'
alias dir='exa -D --header -l '


# bat
# ==========================
# cargo install bat
alias ct='bat '

# JSON prettifier
# ==========================
# sudo apt install jq
# sudo apt install moreutils (for sponge)
# jq . file.json | sponge file.json
# Write an script to do the thing - jsonf

# Zoxide
# ==========================
# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
eval "$(zoxide init zsh)"

# Fuzzy Finder 
# ==========================
# sudo apt install fzf
# needs neovim - sudo apt install neovim
# alias finder="fzf --margin 10% --border --reverse --prompt='$ ' | xargs lvim"
# export FZF_DEFAULT_COMMAND="find -L" # For looking at the hidden files
alias finder="fzf --no-clear --margin 5% --color bg:#353E42 --reverse | xargs lvim"
alias fzf='fzf --margin 5% --color bg:#353E42 --reverse'

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
alias diffhtml='diff2html -i file -- '

# SQL Formatter
# npm i -g sql-formatter-cli
alias sqlf='sql-formatter-cli --file '

# Tmux
# sudo apt install tmux
alias tmux='tmux -u '

# Neovim 
alias v='nvim'

# Zathura
# sudo apt install zathura
alias pdf='zathura'
alias ..='cd ..'

export JAVA_HOME=/opt/OracleJava
export ANT_HOME=/opt/ANT
export PATH=$PATH:$JAVA_HOME/bin:$ANT_HOME/bin

alias mc='mc --nocolor'
alias apt='sudo nala'