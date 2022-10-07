#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit;

git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".java_profile" \
		--exclude "brew.sh" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude ".macos" \
		--exclude ".gitignore" \
		--exclude ".gitignore_config" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude ".zshrc" \
		-avh --no-perms . ~;
	# 重命名配置
	cp .gitignore_config ~/.gitignore;
	# 使用 zsh 必须要在 zsh 环境下才能 
	zsh;
	# shellcheck source=/dev/null
	source ~/.zshrc;
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
