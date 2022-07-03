autoload -Uz compinit
compinit

ZLS_COLORS="$LS_COLORS:=(#b) #(\-  \-\- )(*)=0=0=01;34"
zstyle ':completion:*' completer _extensions _complete
zstyle ':completion:*' menu select search
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-colors ${(s.:.)ZLS_COLORS}
