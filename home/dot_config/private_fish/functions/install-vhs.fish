function install-vhs --description "Install VHS terminal recorder"
    gum confirm "Install VHS into $HOME/.local/bin?" || return

    set vhs_version (curl -s "https://api.github.com/repos/charmbracelet/vhs/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    set archive (string join "" "vhs_" $vhs_version "_Linux_x86_64.tar.gz")
    gum spin --title "Downloading VHS $vhs_version" -- curl -LO \
        "https://github.com/charmbracelet/vhs/releases/latest/download/$archive"

    set tmpdir (mktemp -d)
    tar xf $archive -C $tmpdir
    cp (find $tmpdir -name vhs -type f) "$HOME/.local/bin/vhs"
    chmod +x "$HOME/.local/bin/vhs"
    rm -rf $tmpdir $archive

    gum log --level info "Successfully installed VHS $vhs_version"
end
