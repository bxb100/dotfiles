#!/usr/bin/env bash

brew cleanup --prune=all
brew update
brew upgrade

# 工具集
# https://github.com/tldr-pages/tlrc
brew install tlrc
brew install ffmpeg
# 别名 rg
brew install ripgrep
brew install tree
# shell 脚本检查
brew install shellcheck
# find 替代品
brew install fd
# 感觉比 rename 好用
brew install mmv
# tailscale 比较好用, 替代 frp 也可以
brew install tailscale
# 简单容器
brew install http-server
# 使用 neovim
brew install nvim

# Deep clean
# https://github.com/tw93/mole
brew install tw93/tap/mole
# cat 的替代品
brew install bat
# ls 的替代品
brew install eza
# fixit, thefuck 的替代
# https://github.com/eugene-babichenko/fixit/
brew install eugene-babichenko/fixit/fixit
# https://yazi-rs.github.io/docs/installation#homebrew
brew install yazi
