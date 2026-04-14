function install-micro --description "Install Micro text editor"
    gum confirm "Install Micro into $HOME/.local/bin?" || return
    
    set micro_version (curl -s "https://api.github.com/repos/micro-editor/micro/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    set archive (string join "" "micro-" $micro_version "-linux64.tar.gz")

    gum spin --title "Downloading Micro $micro_version..." -- curl -LO "https://github.com/micro-editor/micro/releases/latest/download/$archive"
    tar xf $archive --strip-components=1 -C "$HOME/.local/bin" (string join "" "micro-" $micro_version "/micro")
    rm $archive

    gum log --level info "Successfully installed Micro $micro_version"
end
