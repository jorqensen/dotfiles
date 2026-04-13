# dotfiles

My dotfiles managed with [Chezmoi](https://www.chezmoi.io/)

## Installation

```bash
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply jorqensen
```

> [!NOTE]
> This will install chezmoi to `$HOME/.local/bin` and apply the dotfiles in one swoop. Please refer to the official [Chezmoi documentation](https://www.chezmoi.io/) to understand installation and usage.

> [!WARNING]
> These dotfiles *heavily assumes* you're running WSL2 with Debian/Ubuntu. Please apply with caution in other environments.

## How it works

When you first initialize these dotfiles, you will be prompted to install optional tools such as `lazygit`. The configuration will get saved to `$HOME/.config/chezmoi/chezmoi.toml`. The config will then be parsed and install the selected tools, using the [install-optional.sh](home/.chezmoiscripts/run_onchange_before_install-optional.sh.tmpl) script.

## Tools

- [Fish](https://github.com/fish-shell/fish-shell)
- [Starship](https://github.com/starship/starship)
- [Zoxide](https://github.com/ajeetdsouza/zoxide)
- [FZF](https://github.com/junegunn/fzf)
- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [Eza](https://github.com/eza-community/eza)
- [Just](https://github.com/casey/just)
- [Lazygit](https://github.com/jesseduffield/lazygit)
- [Lazydocker](https://github.com/jesseduffield/lazydocker)
- [Wishlist](https://github.com/charmbracelet/wishlist)
