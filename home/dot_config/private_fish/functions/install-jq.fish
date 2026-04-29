function install-jq --description "Install jq JSON processor"
    gum confirm "Install jq into $HOME/.local/bin?" || return

    set jq_version (curl -s "https://api.github.com/repos/jqlang/jq/releases/latest" | grep -Po '"tag_name": "jq-\K[0-9.]+')

    gum spin --title "Downloading jq $jq_version" -- curl -L "https://github.com/jqlang/jq/releases/latest/download/jq-linux-amd64" -o "$HOME/.local/bin/jq"
    chmod +x "$HOME/.local/bin/jq"

    gum log --level info "Successfully installed jq $jq_version"
end
