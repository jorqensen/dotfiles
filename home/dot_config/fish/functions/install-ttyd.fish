function install-ttyd --description "Install ttyd terminal web server"
    gum confirm "Install ttyd into $HOME/.local/bin?" || return

    set ttyd_version (curl -s "https://api.github.com/repos/tsl0922/ttyd/releases/latest" | grep -Po '"tag_name": "\K[0-9.]+')
    gum spin --title "Downloading ttyd $ttyd_version" -- curl -L -o "$HOME/.local/bin/ttyd" \
        "https://github.com/tsl0922/ttyd/releases/latest/download/ttyd.x86_64"
    chmod +x "$HOME/.local/bin/ttyd"

    gum log --level info "Successfully installed ttyd $ttyd_version"
end
