#!/usr/bin/env bash

command -v rsync >/dev/null 2>&1 || { echo >&2 "I require rsync but it's not installed.  Aborting."; exit 1; }

cd "$(dirname "${BASH_SOURCE[0]}")" || exit;

git pull origin main;

function reloadBashrc() {
	grep '.bash_profile;' ~/.bashrc || echo "[ -n \"\$PS1\" ] && source ~/.bash_profile;" >> ~/.bashrc;
	# shellcheck source=/dev/null
	source ~/.bash_profile;
}

function doIt() {
	rsync --exclude ".git/" \
		--exclude "*.sh" \
		--exclude ".java_profile" \
		--exclude ".DS_Store" \
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
	# shellcheck source=/dev/null
	(command -v zsh > /dev/null && zsh && source ~/.zshrc) || reloadBashrc;
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	doIt;
else
	read -rp "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
