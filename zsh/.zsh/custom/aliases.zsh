alias bat="bat --theme=gruvbox-dark"

alias f='nvim $(fzf -m --preview "/usr/bin/batcat --theme=gruvbox-dark --color=always  {}")'

alias dk='docker container rm $(docker container ls --format "{{.ID}} {{.Image}} {{.Names}}" | fzf --multi | awk "{print \$1}")'
alias pk='sudo -v; sudo lsof -i -P -n | sudo grep LISTEN | fzf --multi | awk "{print $2}" | xargs -r sudo kill -9'

# Docker
alias dc="docker compose"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dup="docker compose up -d"
alias down="docker compose down"

# Tmux
alias tn="tmux new-session -s"
alias tls="tmux ls"
alias aa="tmux a -t "
alias k="tmux kill-session && echo 'all sessions killed !!'"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gs="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add '
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'
alias gsw='git switch'


# Ls
alias ll="eza -alh"
alias ls="eza --icons"
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltt="eza --tree --level=3 --long --icons --git"
alias tree="eza --tree"
alias c="clear"

alias ff="exec $SHELL"
alias v="nvim"

# alias intellij_path="~/.local/share/JetBrains/Toolbox/scripts/idea"
# alias idea="intellij_path \"\$@\" &>/dev/null &"
idea() {
    if [ -n "$1" ]; then
        PROJECT_DIR=$(realpath "$1")
        ~/.local/share/JetBrains/Toolbox/scripts/idea "$PROJECT_DIR" &>/dev/null &
    else
        ~/.local/share/JetBrains/Toolbox/scripts/idea &>/dev/null &
    fi
}
