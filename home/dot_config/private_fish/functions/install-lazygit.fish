function install-lazygit --description "Install Lazygit TUI"
    gum confirm "Install Lazygit into $HOME/.local/bin?" || return
    
    set lazygit_version (curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    set archive (string join "" "lazygit_" $lazygit_version "_Linux_x86_64.tar.gz")

    gum spin --title "Downloading Lazygit $lazygit_version" -- curl -LO "https://github.com/jesseduffield/lazygit/releases/latest/download/$archive"
    tar xf $archive -C "$HOME/.local/bin" lazygit
    rm $archive
    
    gum log --level info "Successfully installed Lazygit $lazygit_version"
end
