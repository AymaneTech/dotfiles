for config_file ($HOME/.zsh/config/*.zsh) source $config_file

for custom_file ($HOME/.zsh/custom/*.zsh) source $custom_file

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
source "/home/geek/.sdkman/bin/sdkman-init.sh"

eval $(keychain --eval --agents ssh ~/.ssh/personal ~/.ssh/work 2>/dev/null)




# fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc


# Load Angular CLI autocompletion.
source <(ng completion script)
