# dotfiles

My dotfiles managed with [Chezmoi](https://www.chezmoi.io/)

# Usage

Install Chezmoi and initalize the dotfiles:

```bash
$ sh -c "$(curl -fsLS get.chezmoi.io/lb)"
$ chezmoi init https://github.com/jorqensen/dotfiles.git
```

> [!TIP]
> It is possible to install and initialize the dotfiles in a single command

```bash
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply $GITHUB_USERNAME
```

> [!IMPORTANT]
> The above installs Chezmoi in .local/bin as opposed to ./bin - omit /lb from the URL to avoid this.
