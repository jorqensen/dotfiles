function install-wishlist --description "Install Wishlist SSH directory TUI"
    gum confirm "Install Wishlist into $HOME/.local/bin?" || return

    set wishlist_version (curl -s "https://api.github.com/repos/charmbracelet/wishlist/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    set archive (string join "" "wishlist_" $wishlist_version "_Linux_x86_64.tar.gz")

    gum spin --title "Downloading Wishlist $wishlist_version..." -- curl -LO "https://github.com/charmbracelet/wishlist/releases/latest/download/$archive"
    tar xf $archive -C "$HOME/.local/bin" wishlist
    rm $archive

    gum log --level info "Successfully installed Wishlist $wishlist_version"
end
