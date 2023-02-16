#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# 工具集
brew install tldr
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

# Remove outdated versions from the cellar.
brew cleanup
