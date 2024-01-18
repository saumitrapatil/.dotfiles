ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=200
HISTFILE="$HOME/.zsh_history"
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
export TERMINAL="wezterm"
# export CM_LAUNCHER=rofi
# export CM_SELECTIONS="clipboard"
# export CM_DEBUG=1
# export CM_OUTPUT_CLIP=0
# export CM_MAX_CLIPS=10
# export CM_HISTLENGTH=10
# export GDK_BACKEND=x11
# export QT_QPA_PLATFORM=x11
export PATH=/home/saumitra/.spicetify:/home/saumitra/.local/bin:/home/saumitra/.cargo/bin:~/.emacs.d/bin:/home/saumitra/bin:/home/saumitra/Applications:$PATH
# export NODE_OPTIONS="--openssl-legacy-provider"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# options
setopt nobeep

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
