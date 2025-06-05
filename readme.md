Managed with [chezmoi](https://www.chezmoi.io/)

See [Daily operations](https://www.chezmoi.io/user-guide/daily-operations/) for a list of frequent commands.

## Setup

If chezmoi is installed:
```shell
chezmoi init --apply --verbose https://github.com/lkhrs/dotfiles.git
```

If chezmoi is not installed:

Method 1: Download and run one-liner
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/lkhrs/dotfiles/refs/heads/main/install.sh)"
```

Method 2: Download first, add exec flag, run
```shell
curl -fsSLO https://raw.githubusercontent.com/lkhrs/dotfiles/refs/heads/main/install.sh
chmod +x install.sh
./install.sh
```