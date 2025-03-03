ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=200
HISTFILE="$HOME/.zsh_history"
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
export TERMINAL="wezterm"
export CM_LAUNCHER=rofi
export CM_SELECTIONS="clipboard"
export CM_DEBUG=1
export CM_OUTPUT_CLIP=0
export CM_MAX_CLIPS=10
export CM_HISTLENGTH=10
export NVM_LAZY_LOAD=true
# export GDK_BACKEND=x11
# export QT_QPA_PLATFORM=x11
export PATH=/home/saumitra/.local/bin:/home/saumitra/.cargo/bin:/home/saumitra/bin:/home/saumitra/Applications:/home/saumitra/.spicetify:$PATH
# export NODE_OPTIONS="--openssl-legacy-provider"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# FZF
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# options
setopt nobeep

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
