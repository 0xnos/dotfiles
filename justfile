default: help

help:
  @just --list

commit:
  git add -A
  git commit -am "update dotfiles"

pull:
  git pull origin main

push:
  git push origin main

backup:
  @cp -rf ~/.zshrc .
  @cp -rf ~/.zsh .
  @cp -rf ~/.tmux.conf .
  @cp -rf ~/.tmux .
  @cp -rf ~/.config .
  @cp -rf ~/.local .
  @cp -rf ~/bin .

