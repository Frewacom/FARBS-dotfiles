#!/bin/sh
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$HOME/.cargo/bin:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="vifm"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/Documents/referbib"
export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export STATUSBAR="dsblocks"
export _JAVA_AWT_WM_NONREPARENTING=1 # Logisim does not display correctly unless this is set
export PASTEL_COLOR_MODE=8bit
export LC_CTYPE="sv_SE.utf-8"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

# fzf colors and settings
export FZF_DEFAULT_OPTS="-m --height 25% --layout=reverse --color fg:7,bg:-1,hl:1,fg+:232,bg+:1,hl+:255 --color info:7,prompt:2,spinner:1,pointer:232,marker:1"

# Load secret vars into env
source "${HOME}/.dotfiles/secrets"

# Add support for installation of global npm modules without running as root
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

# Switch escape and caps if tty:
sudo -n loadkeys ~/.local/bin/ttymaps.kmap 2>/dev/null
