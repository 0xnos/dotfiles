 zsh-plugin "zsh-autosuggestions"
 zsh-plugin "zsh-syntax-highlighting"
 zsh-plugin "zsh-history-substring-search"

 zmodload zsh/terminfo

 zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
 zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
 zstyle ':completion:*' rehash true                              # automatically find new executables in path
 zstyle ':completion:*' menu select                              # Highlight menu selection
 zstyle ':completion:*' accept-exact '*(N)'
 zstyle ':completion:*' use-cache on
 zstyle ':completion:*' cache-path ~/.zsh/cache

 HISTFILE=~/.zsh/history
 HISTSIZE=10000
 SAVEHIST=10000
 WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

 # Color man pages
 export LESS_TERMCAP_mb=$'\E[01;32m'
 export LESS_TERMCAP_md=$'\E[01;32m'
 export LESS_TERMCAP_me=$'\E[0m'
 export LESS_TERMCAP_se=$'\E[0m'
 export LESS_TERMCAP_so=$'\E[01;47;34m'
 export LESS_TERMCAP_ue=$'\E[0m'
 export LESS_TERMCAP_us=$'\E[01;36m'
 export LESS=-R

 ## Keybindings section
 bindkey -e
 bindkey '^[[7~' beginning-of-line                               # Home key
 bindkey '^[[H' beginning-of-line                                # Home key
 if [[ "${terminfo[khome]}" != "" ]]; then
   bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
 fi
 bindkey '^[[8~' end-of-line                                     # End key
 bindkey '^[[F' end-of-line                                     # End key
 if [[ "${terminfo[kend]}" != "" ]]; then
   bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
 fi
 bindkey '^[[2~' overwrite-mode                                  # Insert key
 bindkey '^[[3~' delete-char                                     # Delete key
 bindkey '^[[C'  forward-char                                    # Right key
 bindkey '^[[D'  backward-char                                   # Left key
 bindkey '^[[5~' history-beginning-search-backward               # Page up key
 bindkey '^[[6~' history-beginning-search-forward                # Page down key

 # Navigate words with ctrl+arrow keys
 bindkey '^[Oc' forward-word                                     #
 bindkey '^[Od' backward-word                                    #
 bindkey '^[[1;5D' backward-word                                 #
 bindkey '^[[1;5C' forward-word                                  #
 bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
 bindkey '^[[Z' undo

# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down# Shift+tab undo last actioni
