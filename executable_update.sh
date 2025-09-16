#!/bin/bash
brew upgrade
if command -v pnpm >/dev/null 2>&1; then
    pnpm self-update
    pnpm update -g --latest
    pnpm approve-builds -g
    echo "Latest installed Node version:"
    pnpm env list | tail -n 1
    echo "Latest available Node version:"
    pnpm env list --remote | tail -n 1
fi
tldr --update
chezmoi update
gh extension upgrade --all
