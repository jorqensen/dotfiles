#!/bin/bash

# Gum
if command -v gum &> /dev/null; then
    gum completion fish > "$HOME/fish/completions/gum.fish"
fi

# Starship
if command -v gum &> /dev/null; then
    starship completions fish > "$HOME/fish/completions/gum.fish"
fi

# Ripgrep
if command -v gum &> /dev/null; then
    rg --generate complete-fish > "$HOME/.config/fish/completions/rg.fish"
fi