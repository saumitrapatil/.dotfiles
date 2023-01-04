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
