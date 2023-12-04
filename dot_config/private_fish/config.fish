# globals
set fish_greeting ""
set -gx TERM xterm-256color
set -gx EDITOR nvim

# Enable VI moves
fish_vi_key_bindings

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# Alias
command -qv nvim && alias vim nvim
alias v nvim
alias t tmux
alias tk "tmux kill-session"
alias ll "exa -l -g --icons"
alias lla "ll --all"
alias llt "ll --tree"
alias c clear
alias b "bat -p"

# Scripts alias
alias f "~/bin/tmux-sessionizer"
alias fw "~/bin/tmux-windownizer"
alias cs "~/bin/cht.sh"

# Chezmoi alias
alias cm chezmoi
alias cme "chezmoi edit --apply"

# Docker alias 
alias d docker
alias dcp "docker compose"

# Fuzzy finder alias
alias ff "fzf --preview 'bat --style=numbers --color=always {}'"
alias ffn "ff | xargs nvim"

# paths
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/google-cloud-sdk/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH ~/go/bin $PATH
set -gx PATH ~/Library/pnpm $PATH

# NodeJs
set --universal nvm_default_version v18.17.0

# set PATH ~/.nvm/versions/node/v16.18.1/bin $PATH
# Come from https://github.com/fish-shell/fish-shell/issues/3023
# better solution here https://medium.com/@joshuacrass/nvm-on-mac-for-fish-users-e00af124c540
