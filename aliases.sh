#!/bin/sh

# ==============================
# General
# ==============================
alias l='eza --header --git --git-repos --time-style=long-iso --long --all --group'
alias lt='eza --icons --tree --all -L 2'
alias cat='ccat'
alias reload='source ~/.zshrc'

# ==============================
# Docker
# ==============================
alias dc='docker compose'
alias dc-reload='dc down && dc up'
