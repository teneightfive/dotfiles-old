#!/bin/bash
cd "$(dirname "$0")"
git pull
function doIt() {
  rsync --exclude "bin/" --exclude "init/" --exclude ".git/" --exclude ".DS_Store" --exclude ".cask" --exclude ".brew" --exclude ".osx" --exclude ".install-deps.sh" --exclude "sync.sh" --exclude "README.md" --exclude "Brewfile" -av --no-perms . ~
  source ~/.bash_profile
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt
