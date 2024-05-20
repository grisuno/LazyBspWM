#!/bin/bash

# Paquetes necesarios
packages=(
  bspwm
  sxhkd
  compton
  feh
  polybar
  zsh
  zsh-syntax-highlighting
  zsh-autosuggestions
  rofi
  gnome-terminal
  google-chrome
  gksudo
  bat
  lsd
  xclip
)

# Actualizar el sistema e instalar los paquetes necesarios
sudo apt update
sudo apt install -y "${packages[@]}"

# Crear directorios necesarios
mkdir -p ~/.config/bspwm/scripts ~/.config/compton ~/.config/sxhkd ~/.config/polybar

# Crear archivos de configuración

# Archivo ~/.config/bspwm/bspwmrc
cat << 'EOF' > ~/.config/bspwm/bspwmrc
#! /bin/sh

sxhkd &
compton --config /home/$USER/.config/compton/compton.conf &
feh --bg-fill /home/$USER/Desktop/Background.jpg &
wmname LG3D &
~/.config/polybar/launch.sh &

bspc config pointer_modifier mod1

bspc monitor -d I II III IV V VI VII VIII IX X

bspc config border_width         2
bspc config window_gap          12

bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true

bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a Chromium desktop='^2'
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off
bspc rule -a burp-StartBurp: state=floating
EOF
chmod +x ~/.config/bspwm/bspwmrc

# Archivo ~/.config/bspwm/scripts/bspwm_resize
cat << 'EOF' > ~/.config/bspwm/scripts/bspwm_resize
#!/usr/bin/env dash

if bspc query -N -n focused.floating > /dev/null; then
  step=20
else
  step=100
fi

case "$1" in
  west) dir=right; falldir=left; x="-$step"; y=0;;
  east) dir=right; falldir=left; x="$step"; y=0;;
  north) dir=top; falldir=bottom; x=0; y="-$step";;
  south) dir=top; falldir=bottom; x=0; y="$step";;
esac

bspc node -z "$dir" "$x" "$y" || bspc node -z "$falldir" "$x" "$y"
EOF
chmod +x ~/.config/bspwm/scripts/bspwm_resize

# Archivo ~/.config/compton/compton.conf
cat << 'EOF' > ~/.config/compton/compton.conf
active-opacity = 0.95;
inactive-opacity = 0.80;
frame-opacity = 0.80;

backend = "glx";

opacity-rule = [
  "50:class_g = 'Bspwm' && class_i = 'presel_feedback'",
  "80:class_g = 'Rofi'",
  "80:class_g = 'Caja'",
  "99:class_g = 'Google-chrome'",
  "99:class_g = 'burp-StartBurp'"
];

blur-background = true;
EOF

# Archivo ~/.config/sxhkd/sxhkdrc
cat << 'EOF' > ~/.config/sxhkd/sxhkdrc
#
# wm independent hotkeys
#

# terminal emulator
super + Return
  gnome-terminal

# program launcher
super + d
  rofi -show run

# make sxhkd reload its configuration files:
super + Escape
  pkill -USR1 -x sxhkd

#
# bspwm hotkeys
#

# quit/restart bspwm
super + alt + {q,r}
  bspc {quit,wm -r}

# close and kill
super + {_,shift + }w
  bspc node -{c,k}

# alternate between the tiled and monocle layout
super + m
  bspc desktop -l next

# send the newest marked node to the newest preselected node
super + y
  bspc node newest.marked.local -n newest.!automatic.local

# swap the current node and the biggest node
super + g
  bspc node -s biggest

#
# state/flags
#

# set the window state
super + {t,shift + t,s,f}
  bspc node -t {tiled,pseudo_tiled,floating,fullscreen}

# set the node flags
super + ctrl + {m,x,y,z}
  bspc node -g {marked,locked,sticky,private}

#
# focus/swap
#

# focus the node in the given direction
super + {_,shift + }{Left,Down,Up,Right}
  bspc node -{f,s} {west,south,north,east}

# focus the node for the given path jump
super + {p,b,comma,period}
  bspc node -f @{parent,brother,first,second}

# focus the next/previous node in the current desktop
super + {_,shift + }c
  bspc node -f {next,prev}.local

# focus the next/previous desktop in the current monitor
super + bracket{left,right}
  bspc desktop -f {prev,next}.local

# focus the last node/desktop
super + {grave,Tab}
  bspc {node,desktop} -f last

# focus the older or newer node in the focus history
super + {o,i}
  bspc wm -h off; \
  bspc node {older,newer} -f; \
  bspc wm -h on

# focus or send to the given desktop
super + {_,shift + }{1-9,0}
  bspc {desktop -f,node -d} '^{1-9,10}'

#
# preselect
#

# preselect the direction
super + ctrl + alt + {Left,Down,Up,Right}
  bspc node -p {west,south,north,east}

# preselect the ratio
super + ctrl + {1-9}
  bspc node -o 0.{1-9}

# cancel the preselection for the focused node
super + ctrl + space
  bspc node -p cancel

# cancel the preselection for the focused desktop
super + ctrl + alt + space
  bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

#
# move/resize
#

# expand a window by moving one of its side outward
super + alt + {Left,Down,Up,Right}
  /home/$USER/.config/bspwm/scripts/bspwm_resize {west,south,north,east}

# move a floating window
super + ctrl + {Left,Down,Up,Right}
  bspc node -v {-20 0,0 20,0 -20,20 0}

# ---------------------------------------------
# CUSTOM
# ---------------------------------------------

# Google-Chrome
super + shift + g
  google-chrome

# Open Burpsuite Professional
super + ctrl + b
  gksudo burp
EOF

# Archivo ~/.zshrc
cat << 'EOF' > ~/.zshrc
# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1

# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
if [[ -r "\${XDG_CACHE_HOME:-\$HOME/.cache}/p10k-instant-prompt-\${(%):-%n}.zsh" ]]; then
  source "\${XDG_CACHE_HOME:-\$HOME/.cache}/p10k-instant-prompt-\${(%):-%n}.zsh"
fi

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "\$(dircolors -b)"
zstyle ':completion:*:default' list-colors \${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|='
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion::kill::processes' list-colors '=(#b) #([0-9]#)=0=01;31'
zstyle ':completion::kill:' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source /home/$USER/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Manual configuration
PATH=/root/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-sudo/sudo.plugin.zsh

# Functions
function mkt(){
  mkdir {nmap,content,exploits,scripts}
}

# Extract nmap information
function extractPorts(){
  ports="\$(cat \$1 | grep -oP '\\d{1,5}/open' | awk '{print \$1}' FS='/' | xargs | tr ' ' ',')"
  ip_address="\$(cat \$1 | grep -oP '\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}' | sort -u | head -n 1)"
  echo -e "\n[] Extracting information...\n" > extractPorts.tmp
  echo -e "\t[] IP Address: \$ip_address" >> extractPorts.tmp
  echo -e "\t[] Open ports: \$ports\n" >> extractPorts.tmp
  echo \$ports | tr -d '\n' | xclip -sel clip
  echo -e "[] Ports copied to clipboard\n" >> extractPorts.tmp
  cat extractPorts.tmp; rm extractPorts.tmp
}

# Set 'man' colors
function man() {
  env \
  LESS_TERMCAP_mb=$'\e[01;31m' \
  LESS_TERMCAP_md=$'\e[01;31m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[01;44;33m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  man "$@"
}

# fzf improvement
function fzf-lovely(){
  if [ "$1" = "h" ]; then
    fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'
  else
    fzf -m --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'
  fi
}

function rmk(){
  scrub -p dod \$1
  shred -zun 10 -v \$1
}

# Finalize Powerlevel10k instant prompt. Should stay at the bottom of ~/.zshrc.
(( ! \${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize
EOF

# Archivo ~/.config/polybar/launch.sh
cat << 'EOF' > ~/.config/polybar/launch.sh
#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar example &

echo "Polybar launched..."
EOF
chmod +x ~/.config/polybar/launch.sh

echo "Configuración de bspwm y otros componentes completada. Reinicia tu sesión para aplicar los cambios."
