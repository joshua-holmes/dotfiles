#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
# 
# by Stephan Raabe (2023)
# -----------------------------------------------------
# ~/.bashrc
# -----------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

alias c='clear'
alias nf='neofetch'
alias pf='pfetch'
alias shutdown='systemctl poweroff'
alias v='nvim'
alias ts='~/dotfiles/scripts/snapshot.sh'
alias matrix='cmatrix'
alias wifi='nmtui'
alias wr='~/dotfiles/waybar/launch.sh'
alias winclass="xprop | grep 'CLASS'"
alias dot="cd ~/dotfiles"

# -----------------------------------------------------
# Window Managers
# -----------------------------------------------------

alias hl="Hyprland"

# -----------------------------------------------------
# GIT
# -----------------------------------------------------

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gco="git checkout"

# -----------------------------------------------------
# SCRIPTS
# -----------------------------------------------------

alias gr='python ~/dotfiles/scripts/growthrate.py'
alias ascii='~/dotfiles/scripts/figlet.sh'

# -----------------------------------------------------
# EDIT CONFIG FILES
# -----------------------------------------------------

alias confp='nvim ~/dotfiles/picom/picom.conf'
alias confb='nvim ~/dotfiles/.bashrc'

# -----------------------------------------------------
# EDIT NOTES
# -----------------------------------------------------

alias notes='nvim ~/notes.txt'

# -----------------------------------------------------
# PYWAL
# -----------------------------------------------------
cat ~/.cache/wal/sequences

# -----------------------------------------------------
# PFETCH if on wm
# -----------------------------------------------------
echo ""
if [[ $(tty) == *"pts"* ]]; then
    pfetch
else
    echo "Start Hyprland with command Hyprland"
fi
