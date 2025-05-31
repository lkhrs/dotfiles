#!/bin/bash
brew upgrade
pnpm self-update
pnpm update -g --latest
tldr --update
pnpm approve-builds -g
chezmoi update
