set -g fish_greeting ""

if status is-interactive
    zoxide init --cmd cd fish | source
    fzf --fish | source
    starship init fish | source
end
