ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=200
HISTFILE="$HOME/.zsh_history"
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
export TERMINAL="alacritty"
export CM_LAUNCHER="rofi"
export CM_SELECTIONS="clipboard"
export CM_DEBUG=1
export CM_OUTPUT_CLIP=0
export CM_MAX_CLIPS=10
export CM_HISTLENGTH=10
export PATH=/home/saumitra/.local/bin:$PATH

# options
setopt nobeep

# source if exist
sie() {
  if [[ -r $1 ]]; then
    source $1
  fi
}

foreach file (
	prompt.zsh
	aliases.zsh
	plugins.zsh
) {
  sie $ZDOTDIR/$file	
}
