#!/bin/sh

# ======================
# home dir organization
# ======================

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"

# ====================
# preferrerd programs
# ====================

export BROWSER="/usr/bin/firefox"
export DOCUMENT_VIEWER="/usr/bin/zathura"
export EDITOR="/usr/bin/nvim"
export FILE_MANAGER="/usr/bin/lf"
export IMAGE_EDITOR="/usr/bin/gimp"
export IMAGE_VIEWER="/usr/bin/sxiv"
export MAIL="/usr/bin/mutt"
export PLAYER="/usr/bin/mpv"
export TERMINAL="/usr/local/bin/st"

# ===============
# custom scripts
# ===============

export PATH=$PATH:/home/$USER/.local/bin
export PATH=$PATH:/home/$USER/.local/bin/dwmblocks

# =========
# go paths
# =========

export GOPATH="${HOME}/GitHub/go"
export GOBIN="${HOME}/GitHub/go/bin"
export PATH=$PATH:$GOBIN

# ===
# fzf
# ===

export FZF_DEFAULT_OPTS="--layout=reverse --height 60%"

# ==
# qt
# ==

export QT_QPA_PLATFORMTHEME="gtk2"

# =======
# firefox
# =======

# smooth scrolling
export MOZ_USE_XINPUT2="1"

# ====
# java
# ====

export _JAVA_AWT_WM_NONREPARENTING=1

# == 
# lf
# ==

# This is the list for lf icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.wav=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨:\
*.java=♨:\
"


