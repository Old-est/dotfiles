if status is-interactive
end

source ~/.config/fish/conf.d/kanagawa.fish

alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'"                                   # show only dotfiles

alias cd="z"
alias cdi="zi"
alias vi="nvim"
alias duf="duf -style ascii"
alias vim="nvim"

function fish_nohist
    set -lx fish_no_history 1
    exec fish
end


starship init fish | source
zoxide init fish | source
batman --export-env | source

