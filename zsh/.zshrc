export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

# ZSH_THEME="xiong-chiamiov-plus"
# ZSH_THEME="robbyrussell
# ZSH_THEME="eastwood"
# ZSH_THEME="simple"
# ZSH_THEME="lukerandall"
ZSH_THEME="miloshadzic"
plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export MANPAGER='nvim +Man!'

alias cat="/usr/bin/batcat --theme=gruvbox-dark"
alias f='nvim $(fzf -m --preview "/usr/bin/batcat --theme=gruvbox-dark --color=always  {}")'
alias dk='docker container rm $(docker container ls --format "{{.ID}} {{.Image}} {{.Names}}" | fzf --multi | awk "{print \$1}")'


# fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc


pokemon-colorscripts --no-title -s -r
