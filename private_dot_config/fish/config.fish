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
set HOMEBREW_NO_ENV_HINTS 0

# Homebrew forbid casks
# set HOMEBREW_FORBIDDEN_CASKS netnewswire

# add composer
fish_add_path ~/.composer/vendor/bin

# add .cargo stuff
fish_add_path ~/.cargo/bin

set fish_greeting ""

# Exports

# bat theme
set -x BAT_THEME ansi

# disable homebrew autoupdate - I'll update when I want to
# set -x HOMEBREW_NO_AUTO_UPDATE 1

# fzf.fish
fzf_configure_bindings --directory=\cf --git_log=\cl --git_status=\cs

# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# set terminfo to use ncurses db
# set -x TERMINFO /opt/homebrew/Cellar/ncurses/6.3/share/terminfo/

# Load rbenv automatically by appending
# the following to ~/.config/fish/config.fish:

# status --is-interactive; and rbenv init - fish | source

# old-style highlighting
# set fish_color_normal normal
# set fish_color_command --bold
# set fish_color_param cyan
# set fish_color_redirection brblue
# set fish_color_comment red
# set fish_color_error brred
# set fish_color_escape bryellow --bold
# set fish_color_operator bryellow
# set fish_color_end brmagenta
# set fish_color_quote yellow
# set fish_color_autosuggestion 555 brblack
# set fish_color_user brgreen

# pnpm
set -gx PNPM_HOME ~/Library/pnpm
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
# Go
fish_add_path ~/go/bin

starship init fish | source

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
