function install-lazydocker --description "Install Lazydocker TUI"
    gum confirm "Install Lazydocker into $HOME/.local/bin?" || return

    set lazydocker_version (curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    set archive (string join "" "lazydocker_" $lazydocker_version "_Linux_x86_64.tar.gz")

    gum spin --title "Downloading Lazydocker $lazydocker_version..." -- curl -LO "https://github.com/jesseduffield/lazydocker/releases/latest/download/$archive"
    tar xf $archive -C "$HOME/.local/bin" lazydocker
    rm $archive

    gum log --level info "Successfully installed Lazydocker $lazydocker_version"
end
