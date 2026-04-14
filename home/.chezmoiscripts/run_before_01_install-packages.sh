#!/bin/bash

# Only run on Debian/Ubuntu amd64
if [[ "$(uname -m)" != "x86_64" ]] || ! grep -qi "debian\|ubuntu" /etc/os-release 2>/dev/null; then
    echo "Skipping package installs: unsupported architecture or OS"
    exit 0
fi

# Set $HOME/.local/bin and create directory, if it doesn't exist
LOCAL_BIN="$HOME/.local/bin"
mkdir -p "$LOCAL_BIN"

# Fish — Shell | https://fishshell.com/
if ! command -v fish &> /dev/null; then
    echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/4/Debian_13/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:4.list
    curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:4/Debian_13/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_4.gpg > /dev/null
    sudo apt update
    sudo apt install fish
fi

# Micro — a modern terminal-based text editor | https://github.com/micro-editor/micro
if ! command -v micro &> /dev/null; then
    MICRO_VERSION=$(curl -s "https://api.github.com/repos/micro-editor/micro/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    curl -LO "https://github.com/micro-editor/micro/releases/latest/download/micro-${MICRO_VERSION}-linux64.tar.gz"
    tar xf "micro-${MICRO_VERSION}-linux64.tar.gz" --strip-components=1 -C "$LOCAL_BIN" "micro-${MICRO_VERSION}/micro"
    rm "micro-${MICRO_VERSION}-linux64.tar.gz"
fi

# Starship — Custom prompt | https://github.com/starship/starship
if ! command -v starship &> /dev/null; then
    curl -sS https://starship.rs/install.sh | sh
fi

# Zoxide — A modern and smarter alternative to cd | https://github.com/ajeetdsouza/zoxide
if ! command -v zoxide &> /dev/null; then
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

# FZF — A command-line fuzzy finder | https://github.com/junegunn/fzf
if ! command -v fzf &> /dev/null; then
    FZF_VERSION=$(curl -s "https://api.github.com/repos/junegunn/fzf/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    curl -LO "https://github.com/junegunn/fzf/releases/latest/download/fzf-${FZF_VERSION}-linux_amd64.tar.gz"
    tar xf "fzf-${FZF_VERSION}-linux_amd64.tar.gz" -C "$LOCAL_BIN"
    rm "fzf-${FZF_VERSION}-linux_amd64.tar.gz"
fi

# RG — An alternative to grep written in Rust | https://github.com/burntsushi/ripgrep
if ! command -v rg &> /dev/null; then
    RG_VERSION=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | grep -Po '"tag_name": "\K[0-9.]+')
    curl -LO "https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz"
    tar xf "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz" --strip-components=1 -C "$LOCAL_BIN" "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl/rg"
    rm "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz"
fi

# Eza — A modern alternative to ls | https://github.com/eza-community/eza
if ! command -v eza &> /dev/null; then
    EZA_VERSION=$(curl -s "https://api.github.com/repos/eza-community/eza/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
    curl -LO "https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz"
    tar xf "eza_x86_64-unknown-linux-gnu.tar.gz" -C "$LOCAL_BIN"
    rm "eza_x86_64-unknown-linux-gnu.tar.gz"
fi
