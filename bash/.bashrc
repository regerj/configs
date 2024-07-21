# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
        for rc in ~/.bashrc.d/*; do
                if [ -f "$rc" ]; then
                        . "$rc"
                fi
        done
fi

unset rc
. "$HOME/.cargo/env"

PS1='\[\e[38;5;77;1m\]\h\[\e[39m\]:\[\e[38;5;134m\]\W\[\e[38;5;51m\][\[\e[3m\]$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)\[\e[23m\]] \[\e[39m\]\$ \[\e[0m\]'

##############################################
# fzf customization
##############################################
eval "$(fzf --bash)"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

##############################################
# bat customization
##############################################
alias cat="bat"
export BAT_THEME=TwoDark

##############################################
# nvim customization
##############################################
alias vim="nvim"

##############################################
# eza customization
##############################################
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --tree --level=2"

##############################################
# zoxide customization
##############################################
alias cd="z"
eval "$(zoxide init bash)"
