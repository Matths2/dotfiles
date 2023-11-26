# Dotfiles

These dotfiles are curated from many sources and exists mainly for my own reference, but feel free to pick out any goodness that might fit well into your config. This repo does not require symlinks, its a bare git repo with git-dir set to `~/dotfiles` and work-dir set to `$HOME`.
[See this Atlassian blog post for reference](https://www.atlassian.com/git/tutorials/dotfiles).

## Components

Config files for `zsh`, `nvim`, `tmux`, `alacritty`, `kitty`, `git`, `karabiner`, `hammerspoon`, `vscode` and `macos settings`.

See `/brew` for software bundle and install script.

## Setup

To install the dotfiles into your home directory you can run the following script, inspect it before running.

```shell
curl -Lks https://raw.githubusercontent.com/Matths2/dotfiles/macos/install.sh | /bin/zsh
```

The script will clone this repo as a bare repo, set up a function which specifies git-dir and work-tree. Backup conflicting directories/files and checkout the dotfiles in their correct locations.

## Inspiration
[Atlassian bare git repo blogpost](https://www.atlassian.com/git/tutorials/dotfiles)

[Michael Bynens and his awesome macos settings](https://github.com/mathiasbynens/dotfiles/tree/main)

[Jogendra dotfiles](https://github.com/jogendra/dotfiles)

[Jason Rudolph keyboard centric setup](https://github.com/jasonrudolph/keyboard)
