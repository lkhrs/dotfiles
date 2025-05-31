#!/bin/sh

# -e: exit on error
# -u: exit on unset variables
set -eu

if ! command -v git >/dev/null 2>&1; then
	echo "Installing Xcode Command Line Tools"	
  xcode-select --install
fi

if ! command -v brew >/dev/null 2>&1; then
	echo "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing latest version of Git"
brew install git

if ! chezmoi="$(command -v chezmoi)"; then
	echo "Installing chezmoi"
	brew install chezmoi
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

set -- init --apply --source="${script_dir}"

echo "Running 'chezmoi $*'" >&2
# exec: replace current process with chezmoi
exec "$chezmoi" "$@"
