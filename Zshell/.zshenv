# This File is called immediately after /etc/zshenv
# PATH Related settings could be added here

HISTSIZE=10000
SAVEHIST=10000

export ZDOTDIR=$HOME/.config/zsh/

export JAVA_HOME=/usr/lib/jvm/java-8/
export PATH=$PATH:$JAVA_HOME/bin

if [ -d "/opt/Ant-1.10.5/" ]; then
    export ANT_HOME=/opt/Ant-1.10.5/
    export PATH=$PATH:$ANT_HOME/bin
else
    echo "ANT not available in /opt "
fi

if [ -d "/opt/NodeJS/" ]; then
    export NODE=/opt/NodeJS/v0.10.32/
    export PATH=$PATH:$NODE/bin
else
    echo "NodeJS Not available in /opt"
fi

export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

export QT_QPA_PLATFORMTHEME=qt5ct
# alias and hashes
alias la='ls -la'
alias ll='ls -lF'
alias lla='ls -laF'
alias mkdir='mkdir -pv'
alias rm='rm -v'

# globals
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g X='|xargs'
alias -g S='|sort'
alias -g US='|sort -u'
alias -g M='|more'

# suffix aliases
alias -s md=nvim # filename.md<cr> opens file in nvim

if ! command -v exa &> /dev/null
then
    alias ls='exa --icons'
    alias la='exa --icons -la'
    alias ll='exa --icons -lF'
    alias lla='exa --icons -laF'
    alias tree='exa --tree --icons'
fi

alias -g L='|less'
alias -g NUL='> /dev/null 2>&1'

if ! command -v lazygit NUL
then
    alias g='lazygit'
fi

if [ -d "$HOME/.config/nvim" ]; then
    hash -d nvim=$HOME/.config/nvim/
else
    echo "Neovim config folder not available"
fi

alias ls='exa --icons'
alias la='exa --icons -la'
alias ll='exa --icons -lF'
alias lla='exa --icons -laF'
alias tree='exa --tree --icons'

source $HOME/.zshrc
