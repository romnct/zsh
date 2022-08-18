# Use modern completion system basic auto/tab complete:
autoload -U compinit
compinit
_comp_options+=(globdots)

zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*' file-list all
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 
