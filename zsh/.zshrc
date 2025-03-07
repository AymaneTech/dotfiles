for config_file ($HOME/.zsh/config/*.zsh) source $config_file

for custom_file ($HOME/.zsh/custom/*.zsh) source $custom_file

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
source "/home/geek/.sdkman/bin/sdkman-init.sh"

eval $(keychain --eval --agents ssh ~/.ssh/personal ~/.ssh/work 2>/dev/null)




# fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc


# Load Angular CLI autocompletion.
source <(ng completion script)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/geek/google-cloud-sdk/path.zsh.inc' ]; then . '/home/geek/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/geek/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/geek/google-cloud-sdk/completion.zsh.inc'; fi
export PATH=$HOME/.local/bin:$PATH
