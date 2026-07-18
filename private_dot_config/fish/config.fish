# vim: syntax=bash

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Add ~/bin to path for Sublime Merge
fish_add_path ~/bin/

# Add Sublime Text to path
fish_add_path /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/

# Homebrew completions
fish_add_path /opt/homebrew/share/fish/vendor_completions.d/

# Homebrew sbin
fish_add_path /opt/homebrew/sbin

# Homebrew disable env hints
set -gx HOMEBREW_NO_ENV_HINTS 1

# add composer
fish_add_path ~/.composer/vendor/bin

# add .cargo stuff
fish_add_path ~/.cargo/bin

set fish_greeting ""

set -g async_prompt_functions _pure_prompt_git

# Exports

# bat theme
set -x BAT_THEME ansi

# disable homebrew autoupdate - I'll update when I want to
# set -x HOMEBREW_NO_AUTO_UPDATE 1

# fzf.fish
fzf_configure_bindings --directory=\cf --git_log=\cl --git_status=\cs

# set terminfo to use ncurses db
# set -x TERMINFO /opt/homebrew/Cellar/ncurses/6.3/share/terminfo/

# Load rbenv automatically by appending
# the following to ~/.config/fish/config.fish:

# status --is-interactive; and rbenv init - fish | source

# pnpm
set -gx PNPM_HOME ~/Library/pnpm
fish_add_path "$PNPM_HOME"
# pnpm end
# Go
fish_add_path ~/go/bin

string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# Make Colima the default Docker socket
# set -gx DOCKER_HOST "unix://$HOME/.colima/default/docker.sock"

# source /Users/luke/.docker/init-fish.sh || true # Added by Docker Desktop

# Add 1Password autocompletions
# op completion fish | source

# Reload the shell with "fish"
function fish
    source ~/.config/fish/config.fish
end

# Mole shell completion
set -l output (mole completion fish 2>/dev/null); and echo "$output" | source

# Set Zed as terminal editor
set -Ux EDITOR "zed --wait"