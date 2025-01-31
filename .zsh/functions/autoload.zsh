autoload -Uz bracketed-paste-magic
autoload -U compinit colors zcalc
zle -N bracketed-paste bracketed-paste-magic
compinit -d
colors
