for config_file ($HOME/.zsh/config/*.zsh) source $config_file

for custom_file ($HOME/.zsh/custom/*.zsh) source $custom_file

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# eval $(keychain --eval --agents ssh ~/.ssh/personal ~/.ssh/work 2>/dev/null)
export PATH=$HOME/.local/bin:$PATH
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools


if [ -f '/home/geek/google-cloud-sdk/path.zsh.inc' ]; then . '/home/geek/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/geek/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/geek/google-cloud-sdk/completion.zsh.inc'; fi

