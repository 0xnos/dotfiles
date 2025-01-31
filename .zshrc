source ~/.zsh/functions/autoload.zsh
source ~/.zsh/functions/setopts.zsh
source ~/.zsh/functions/core.zsh
source ~/.zsh/default.zsh

zsh-theme "dracula"
zsh-prompt "default"

export EDITOR=nvim
export BROWSER=firefox
export MANPAGE='nvim +Man!'
export NNN_USE_EDITOR=1

export EMACS_ROOT="$HOME/.config/emacs"
export GAMBIT_ROOT="/usr/local/gambit/current"
export GERBIL_GSC="$GAMBIT_ROOT/bin/gsc"
export GERBIL_ROOT="$HOME/.gerbil"
export PYENV_ROOT="$HOME/.pyenv"

add_path "$HOME/bin"
add_path "$HOME/.cargo/bin"
add_path "$HOME/.local/bin"
add_path "$HOME/.git/bin"
add_path "$GAMBIT_ROOT/bin"
add_path "$GERBIL_ROOT/bin"
add_path "$PYENV_ROOT/bin"
add_path "$EMACS_ROOT/bin"

export LS_COLORS="$(vivid generate molokai)"

alias cat="bat"
alias calc="kalker"
alias cd="z"
alias clock="while true; do tty-clock -tcDsbS -C 4; done"
alias cp="cp -i"                                                # Confirm before overwriting something
alias df="df -h"
alias find="fd"
alias free='free -m'
alias ls="eza --color=never"
alias ll="eza -l"
alias math="numbat"
alias poweroff="ask sudo poweroff"
alias repl="evcxr"
alias reload="source $HOME/.zshrc"
alias reset="reset -Q"
alias ssh="TERM=xterm-256color /usr/bin/ssh"
alias zed="zeditor"
alias zmux="zellij"
# posting
# bagels

alias copy="xclip -selection clipboard"
alias paste="xclip -selection clipboard -o"

chat() {
  ollama run llama3.2
  ollama stop llama3.2
}

crates() {
  local crate_name="$1"
  local api="https://crates.io/api/v1/crates/$crate_name"
  local url="https://crates.io/crates/$crate_name"
  local _status=$(http_status "$api")
  if [ "$_status" = "200" ]; then
    $BROWSER --new-tab $url
  else
    echo "$crate_name does not exist"
  fi
}

docs() {
  local crate_name="$1"
  local url="https://docs.rs/$crate_name"
  local _status=$(http_status "$url")
  if [ "$_status" != "404" ]; then
    $BROWSER --new-tab $url
  else
    echo "$crate_name does not exist"
  fi
}

find-and-replace() {
  rg "$1" --files-with-matches | xargs sed -i "s@$1@$2@g"
}

http_status() {
  curl -s -o /dev/null -w "%{http_code}" "$1"
}

http-status() {
  curl -s -o /dev/null -w "%{http_code}" $@
}

skk() {
  sk --ansi -i -c 'rg --color=always --line-number "{}"'
}

tiny() {
  cfonts "$@" -f tiny
}

vimclean() {
  rm -rf ~/.cache/nvim
  rm -rf ~/.local/share/nvim
}

weather() {
  curl "https://v2.wttr.in/$1"
}

vencord() {
  sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
}

eval "$(atuin init zsh)"
source <(fzf --zsh)
#eval "$(pyenv init -)"
eval "$(zoxide init zsh)"
