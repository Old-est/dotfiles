if status is-interactive
end


alias cd="z"
alias cdi="zi"
alias vi="nvim"
alias ls="eza --icons"

function fish_nohist
    set -lx fish_no_history 1
    exec fish
end


starship init fish | source
zoxide init fish | source
eval (tmuxifier init - fish)
batman --export-env | source

