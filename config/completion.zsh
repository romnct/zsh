# Use modern completion system basic auto/tab complete:
autoload -U compinit
compinit
_comp_options+=(globdots)
#zstyle
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{yellow}%B--%d--%b%f '
zstyle ':completion:*' file-list all
zstyle ':completion:*' group-name ''
