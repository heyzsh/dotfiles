#             _                
#            | |               
#  _____  ___| |__   ____ ____ 
# (___  )/___)  _ \ / ___) ___)
#  / __/|___ | | | | |  ( (___ 
# (_____|___/|_| |_|_|   \____)
#                              

# ======
# prompt
# ======

# enable colors 
autoload -U colors && colors

# prompt
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
PS1="%{$fg[green]%}[%{$reset_color%} %{$fg[blue]%}%1~%{$reset_color%} %{$fg[green]%}]%{$reset_color%}$%b "

# auto change dir upon entering the dir name
setopt autocd

# enables interactivity
setopt interactive_comments

# =======
# history
# =======

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.cache/zsh_history

bindkey '^R' history-incremental-search-backward

# =======
# aliases
# =======

[ -f "${HOME}/.config/shell/aliases" ] && source "${HOME}/.config/shell/aliases"

# ==============
# autocompletion
# ==============

autoload -U compinit
# interactive select menu on tab
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# include hidden files
_comp_options+=(globdots)

# =======
# vi mode
# =======

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

bindkey -s '^o' 'lfcd\n'
bindkey -s '^a' 'bc -lq\n'
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# ======
# syntax
# ======

# Load syntax highlighting; should be last.
source "${ZDOTDIR}/plugins/fsh/fast-syntax-highlighting.plugin.zsh" 2>/dev/null

