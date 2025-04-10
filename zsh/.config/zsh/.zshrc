# zmodload zsh/zprof
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

# uncomment the below line if nvm installed via AUR
# source /usr/share/nvm/init-nvm.sh

# pnpm
export PNPM_HOME="/home/saumitra/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/saumitra/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/saumitra/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/saumitra/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/saumitra/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"
eval "$(fzf --zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/saumitra/google-cloud-sdk/path.zsh.inc' ]; then . '/home/saumitra/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/saumitra/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/saumitra/google-cloud-sdk/completion.zsh.inc'; fi

# zprof
