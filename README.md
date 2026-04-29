# dotfiles

My dotfiles managed with [Chezmoi](https://www.chezmoi.io/)

## Installation

```bash
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply jorqensen

# Optionally set Fish as the default shell afterwards.
chsh -s (which fish)
```

> [!NOTE]
> This will install chezmoi to `$HOME/.local/bin` and apply the dotfiles in one swoop. Please refer to the official [Chezmoi documentation](https://www.chezmoi.io/) to understand installation and usage.

> [!WARNING]
> These dotfiles *heavily assumes* you're running WSL2 with Debian/Ubuntu. Please apply with caution in other environments.

## How it works

The dotfiles are applied in the following steps.

**1. Install core packages**

The [install-packages](home/.chezmoiscripts/run_before_01_install-packages.sh) script will run, to install core packages for a better shell experience.

**2. Dotfiles will be applied**

Every dotfile will be applied and put in the respective location.

**3. Generate completions**

Completions for the core packages will be generated and placed in `$HOME/.config/fish/completions`.

## Tools

| Tool | Type | Install |
|------|------|---------|
| [Fish](https://github.com/fish-shell/fish-shell) | Core | Automatic |
| [Starship](https://github.com/starship/starship) | Core | Automatic |
| [Zoxide](https://github.com/ajeetdsouza/zoxide) | Core | Automatic |
| [FZF](https://github.com/junegunn/fzf) | Core | Automatic |
| [Ripgrep](https://github.com/BurntSushi/ripgrep) | Core | Automatic |
| [Eza](https://github.com/eza-community/eza) | Core | Automatic |
| [Gum](https://github.com/charmbracelet/gum) | Core | Automatic |
| [Just](https://github.com/casey/just) | Optional | `install-just` |
| [Lazygit](https://github.com/jesseduffield/lazygit) | Optional | `install-lazygit` |
| [Lazydocker](https://github.com/jesseduffield/lazydocker) | Optional | `install-lazydocker` |
| [Wishlist](https://github.com/charmbracelet/wishlist) | Optional | `install-wishlist` |
| [Micro](https://github.com/micro-editor/micro) | Optional | `install-micro` |
| [FFmpeg](https://github.com/BtbN/FFmpeg-Builds) | Optional | `install-ffmpeg` |
| [GoReleaser](https://github.com/goreleaser/goreleaser) | Optional | `install-goreleaser` |
| [ttyd](https://github.com/tsl0922/ttyd) | Optional | `install-ttyd` |
| [VHS](https://github.com/charmbracelet/vhs) | Optional | `install-vhs` |
| [JQ](https://github.com/jqlang/jq) | Optional | `install-jq` |

> [!NOTE]
> Optional packages and their respective installation scripts are only available in the `fish` shell.