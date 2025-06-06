#!/bin/bash
brew upgrade
pnpm self-update
pnpm update -g --latest
pnpm approve-builds -g
echo "Latest installed Node version:"
pnpm env list | tail -n 1
echo "Latest available Node version:"
pnpm env list --remote | tail -n 1
tldr --update
chezmoi update
