alias na='nvim ~/.config/zsh/aliases.zsh'
alias nz='nvim ~/.config/zsh/.zshrc'
alias no='nvim ~/.config/zsh/options.zsh'
alias nbs='nvim ~/.config/bspwm/bspwmrc'
alias ns='nvim ~/.config/sxhkd/sxhkdrc'
alias nx='nvim ~/.xinitrc'
alias np='nvim ~/.config/nvim/lua/user/plugins.lua'
alias n='nvim'
alias ls='eza --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | grep -E "^\."'
alias wp='feh --bg-fill --randomize ~/Pictures/Wallpapers'
alias make50='make CC=clang CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow" LDLIBS="-lcrypt -lcs50 -lm"'
alias pwrmode='cat /sys/devices/platform/asus-nb-wmi/fan_boost_mode'

# scripts
alias ffrec='~/.scripts/record-x11.sh'
alias swsink='~/.scripts/switch-sink.sh'

# git
alias gs='git status'
alias ga='git add'
