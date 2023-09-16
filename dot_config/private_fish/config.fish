# globals
set fish_greeting ""
set -gx TERM xterm-256color
set -gx EDITOR nvim

# Enable VI moves
# fish_vi_key_bindings

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# alias
command -qv nvim && alias vim nvim
alias t "tmux"
alias tk "tmux kill-session"
alias ll "exa -l -g --icons"
alias lla "ll -a"
alias c "clear"
alias f "~/bin/tmux-sessionizer"
alias cs "~/bin/cht.sh"
alias cm "chezmoi"
alias cme "chezmoi edit --apply"
alias v "nvim"

# paths
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/google-cloud-sdk $PATH

# NodeJs
set --universal nvm_default_version v18.16.0

# set PATH ~/.nvm/versions/node/v16.18.1/bin $PATH 
# Come from https://github.com/fish-shell/fish-shell/issues/3023
# better solution here https://medium.com/@joshuacrass/nvm-on-mac-for-fish-users-e00af124c540

# pnpm
set -gx PNPM_HOME "/Users/alexandre/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

