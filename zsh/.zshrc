zmodload zsh/zprof
#eval "$(starship init zsh)"
#eval "$(zoxide init zsh)"
#source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export JAVA_HOME=/opt/OracleJava
export ANT_HOME=/opt/ANT
export PATH=$PATH:$JAVA_HOME/bin:$ANT_HOME/bin:$HOME/.cargo/bin:/opt/PlatformTools/platform-tools

alias ls='exa --icons'
alias tree='exa --tree --icons'
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

#bindkey -v
# nvm alias default v0.10.32
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
zprof
