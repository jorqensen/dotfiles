function install-just --description "Install Just command runner"
    gum confirm "Install Just into $HOME/.local/bin?" || return

    gum spin --title "Downloading Just..." -- bash -c 'curl --proto "=https" --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to "$HOME/.local/bin"'

    gum log --level info "Successfully installed Just "(just --version)
end
