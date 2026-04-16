function install-goreleaser --description "Install GoReleaser"
    gum confirm "Install GoReleaser into $HOME/.local/bin?" || return

    set goreleaser_version (curl -s "https://api.github.com/repos/goreleaser/goreleaser/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    set archive (string join "" "goreleaser_Linux_x86_64.tar.gz")
    gum spin --title "Downloading GoReleaser $goreleaser_version" -- curl -LO "https://github.com/goreleaser/goreleaser/releases/download/v$goreleaser_version/$archive"
    tar xf $archive -C "$HOME/.local/bin" goreleaser
    rm $archive

    gum log --level info "Successfully installed GoReleaser $goreleaser_version"
end
