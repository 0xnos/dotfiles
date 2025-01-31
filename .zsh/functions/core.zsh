add_path() {
  if [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$PATH:$1"
  fi
}

add ldpath() {
  if [ -z "$LD_LIBRARY_PATH" ]; then
    export LD_LIBRARY_PATH="$1"
  elif [[ ! "$LD_LIBRARY_PATH" =~ $1 ]]; then
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$1"
  fi
}

zsh-plugin() {
    local plugin_name=$@
    source ~/.zsh/plugins/$plugin_name/$plugin_name.zsh
}
zsh-prompt() {
    source ~/.zsh/prompts/$@.zsh
}

zsh-theme() {
    source ~/.zsh/themes/$@.zsh
}
