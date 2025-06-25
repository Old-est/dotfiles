if status is-interactive
    # Commands to run in interactive sessions can go here
end


alias cd="z"
alias cdi="zi"
alias vi="nvim"
alias ls="eza --icons"

starship init fish | source
zoxide init fish | source
eval (tmuxifier init - fish)
batman --export-env | source
