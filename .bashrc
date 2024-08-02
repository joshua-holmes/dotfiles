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

export EDITOR=nvim
export VISUAL=nvim

export PATH="${HOME}/.cargo/bin:${PATH}"
export PATH="$GEM_HOME/bin:$HOME/.rvm/bin:/home/josh/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add .NET Core SDK tools
export PATH="$PATH:/home/josh/.dotnet/tools"

# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

alias c='clear'
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
# EDIT CONFIG FILES
# -----------------------------------------------------

alias confb='nvim ~/dotfiles/.bashrc'

# -----------------------------------------------------
# EDIT NOTES
# -----------------------------------------------------

alias notes='nvim ~/notes.txt'

# -----------------------------------------------------
# SERVER ACCESS
# -----------------------------------------------------

alias server-keepass='TERM=xterm ssh -i ~/.ssh/keepass.pem admin@keepass.holmes-software.com'
alias server-wireguard='TERM=xterm ssh -i ~/.ssh/vpn.pem admin@vpn.holmes-software.com'
alias server-skyrim='TERM=xterm ssh -i ~/.ssh/aws-archy.pem admin@skyrim.holmes-software.com'
alias server-debby='TERM=xterm ssh -i ~/.ssh/id_rsa 192.168.1.69'

# -----------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------

docker-clean() {
    docker rm -f $(docker ps -aq)
    docker image rm -f $(docker images -q)
}

echo ""
if [[ $(tty) == *"pts"* ]]; then
    # Import colorscheme from 'wal' asynchronously
    # &   # Run the process in the background.
    # ( ) # Hide shell job control messages.
    (cat ~/.cache/wal/sequences &)

    fastfetch --config ~/.config/fastfetch/bashrc-config.jsonc
else
    echo "Start Hyprland with command hl"
fi
