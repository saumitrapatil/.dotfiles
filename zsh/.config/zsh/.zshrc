# source if exist
sie() {
  if [[ -r $1 ]]; then
    source $1
  fi
}

foreach file (
	options.zsh
	# prompt.zsh
	aliases.zsh
	plugins.zsh
) {
  sie $ZDOTDIR/$file	
}

eval "$(starship init zsh)"
