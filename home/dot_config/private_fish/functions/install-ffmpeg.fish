function install-ffmpeg --description "Install ffmpeg and ffprobe"
    gum confirm "Install ffmpeg into $HOME/.local/bin?" || return

    set archive "ffmpeg-master-latest-linux64-gpl.tar.xz"
    gum spin --title "Downloading ffmpeg (latest master)" -- curl -LO \
        "https://github.com/BtbN/FFmpeg-Builds/releases/latest/download/$archive"
    tar xf $archive --strip-components=2 -C "$HOME/.local/bin" \
        --wildcards "*/bin/ffmpeg" "*/bin/ffprobe"
    rm $archive

    gum log --level info "Successfully installed ffmpeg and ffprobe"
end
