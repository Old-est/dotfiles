if status is-interactive
end


alias cd="z"
alias cdi="zi"
alias vi="nvim"
alias ls="eza --icons"
alias duf="duf -style ascii"
alias vim="nvim"

function fish_nohist
    set -lx fish_no_history 1
    exec fish
end


starship init fish | source
zoxide init fish | source
batman --export-env | source


# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/oldest/.lmstudio/bin
# End of LM Studio CLI section

