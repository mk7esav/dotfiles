HISTSIZE=10000
SAVEHIST=10000
export ZDOTDIR=$HOME/.config/zsh/
export JAVA_HOME=/usr/lib/jvm/java-8/
export PATH=$PATH:$JAVA_HOME/bin
export ANT_HOME=/opt/Ant-1.10.5/
export PATH=$PATH:$ANT_HOME/bin
export NODE=/opt/NodeJS/v0.10.32/
export PATH=$PATH:$NODE/bin
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="google-chrome"
export QT_QPA_PLATFORMTHEME=qt5ct
#
# alias and hashes
alias la='ls -la'
alias ll='ls -lF'
alias lla='ls -laF'
alias mkdir='mkdir -pv'
alias rm='rm -v'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g X='|xargs'
alias -g S='|sort'
alias -g US='|sort -u'
alias -g M='|more'

# suffix aliases
alias -s md=nvim # filename.md<cr> opens file in nvim

alias ls='exa --icons'
alias la='exa --icons -la'
alias ll='exa --icons -lF'
alias lla='exa --icons -laF'
alias tree='exa --tree --icons'

alias -g L='|less'
alias -g NUL='> /dev/null 2>&1'
hash -d nvim=$HOME/.config/nvim/

alias ls='exa --icons'
alias la='exa --icons -la'
alias ll='exa --icons -lF'
alias lla='exa --icons -laF'
alias tree='exa --tree --icons'

function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=`echo $1 | cut -d "/" -f 2`
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

function zsh_add_completion() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        # For completions
		completion_file_path=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
		fpath+="$(dirname "${completion_file_path}")"
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
		fpath+=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
        [ -f $ZDOTDIR/.zccompdump ] && $ZDOTDIR/.zccompdump
    fi
	completion_file="$(basename "${completion_file_path}")"
	if [ "$2" = true ] && compinit "${completion_file:1}"
}

setopt rcquotes 
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef

bindkey -v # can also take emacs -e 
bindkey "^L" clear-screen

unset BEEP
autoload -Uz compinit

zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

autoload -Uz colors && colors
autoload -Uz vcs_info

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

zstyle ':vcs_info:*' enable git

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt prompt_subst
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"

#PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}k%{$fg[red]%}@%{$fg[white]%}7%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ "
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
