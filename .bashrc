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
# VARIALBES
# -----------------------------------------------------

export PATH="${HOME}/.cargo/bin:${PATH}"
export PATH="$GEM_HOME/bin:$HOME/.rvm/bin:/home/josh/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
alias neo="cd ~/.config/nvim"
alias rust="nvim ${HOME}/Development/projects/codeforces/problems/test/rust/src/main.rs"
alias sv="cd ~/Development/projects/servo/ && nvim"
alias vpn="~/dotfiles/scripts/vpn.sh"

# -----------------------------------------------------
# WINDOW MANAGER
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
# VIEW ALIASES
# -----------------------------------------------------

alias als="cat ~/.bashrc | rg alias"

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
# FUNCTIONS
# -----------------------------------------------------

docker-clean() {
    docker rm $(docker ps -aq)
    docker image rm $(docker images -q)
}
vpn-server() {
    TERM="xterm" ssh -i ~/.ssh/vpn.pem openvpnas@ec2-54-241-86-227.us-west-1.compute.amazonaws.com
}
torry-server() {
    TERM="xterm" ssh -i ~/.ssh/aws-archy.pem admin@ec2-54-176-160-22.us-west-1.compute.amazonaws.com
}

echo ""
if [[ $(tty) == *"pts"* ]]; then
    pfetch
else
    echo "Start Hyprland with command hl"
fi
