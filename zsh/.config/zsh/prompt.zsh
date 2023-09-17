autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats ' %F{yellow}%b%c%u%F{blue}'

precmd() {vcs_info}

PROMPT='%n in ${PWD/$HOME/~} > '
RPROMPT='%F{8}%*%F{blue}${vcs_info_msg_0_}%f'

PROMPT="%F{14}╭─[%f%n@%m%F{14}]-[%F{226}%1~%F{14}]
╰───%F{11}❯%f "
