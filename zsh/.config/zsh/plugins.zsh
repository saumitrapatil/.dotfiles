# External Plugins

sie ~/.config/zsh/zsh-nvm.zsh
sie ~/.config/zsh/zsh-conda.zsh
sie /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
sie ~/.config/zsh/catppuccin-zsh-syntax-highlighting.zsh
sie /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
sie /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

if [[ -r /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi
