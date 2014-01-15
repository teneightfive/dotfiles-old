#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"
git pull
function syncDot() {
  rsync --exclude "init/" \
        --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude ".brew" \
        --exclude ".cask" \
        --exclude ".install-deps.sh" \
        --exclude ".osx" \
        --exclude "Brewfile" \
        --exclude "README.md" \
        --exclude "sync.sh" \
        -av . ~
}
function syncSt() {
  rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude ".aliases" \
        --exclude ".bash_profile" \
        --exclude ".bash_prompt" \
        --exclude ".brew" \
        --exclude ".cask" \
        --exclude ".exports" \
        --exclude ".functions" \
        --exclude ".git-completion.bash" \
        --exclude ".gitconfig" \
        --exclude ".gitignore" \
        --exclude ".install-deps.sh" \
        --exclude ".osx" \
        --exclude ".path" \
        --exclude "domsmith.itermcolors" \
        --exclude "Brewfile" \
        --exclude "README.md" \
        --exclude "sync.sh" \
        -av ./init/ ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  syncDot
  syncSt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    syncDot
    syncSt
  fi
fi
unset syncDot
unset syncSt
source ~/.bash_profile