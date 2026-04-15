#!/bin/bash

if command -v chezmoi &> /dev/null; then
    chezmoi completion fish --output "$HOME/.config/fish/completions/chezmoi.fish"
fi

# Gum
if command -v gum &> /dev/null; then
    gum completion fish > "$HOME/.config/fish/completions/gum.fish"
fi

# Starship
if command -v gum &> /dev/null; then
    starship completions fish > "$HOME/.config/fish/completions/starship.fish"
fi

# Ripgrep
if command -v gum &> /dev/null; then
    rg --generate complete-fish > "$HOME/.config/fish/completions/rg.fish"
fi
