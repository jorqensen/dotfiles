set -g fish_greeting ""

# Source
source ~/.deno/env.fish

# Paths
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.bun/bin $PATH
set -gx PATH $HOME/.config/composer/vendor/bin $PATH
set -gx PATH /usr/local/go/bin $PATH

# Environment
set -x EDITOR micro
set -x BROWSER explorer.exe
set -x BAT_THEME "gruvbox-light"
set -x FZF_DEFAULT_OPTS "--style full"

# Abbreviations
abbr --add bat batcat
abbr --add cat batcat
abbr --add lg lazygit
abbr --add ld lazydocker
abbr --add art "php artisan"
abbr --add ls eza
abbr --add ll "eza --long --header --icons"
abbr --add la "eza --long --header --icons --all"
abbr --add lt "eza --tree --level=2"


if status is-interactive
    zoxide init --cmd cd fish | source
    fzf --fish | source
    starship init fish | source
end
