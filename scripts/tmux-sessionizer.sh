#!/usr/bin/env bash

# Step 1: Define the directories to search
search_dirs=(
    "$HOME/.dotfiles"
    "$HOME/development"
    "$HOME/development/bitchill"
    "$HOME/development/codecrypto.academy"
    "$HOME/development/mindfolk"
    "$HOME/development/proyects"
    "$HOME/development/pruebas"
    "$HOME/development/sources"
)

# Step 2: Use fzf to let the user select a directory
if [[ $# -eq 1 ]]; then
    selected=$1  # Use argument if provided
else
    # Find directories recursively within search paths
    selected=$(find "${search_dirs[@]}" -mindepth 1 -maxdepth 2 -type d | fzf)
fi

# Step 3: Exit if no directory is selected
if [[ -z $selected ]]; then
    exit 0
fi

# Step 4: Create a tmux session name from the selected directory
selected_name=$(basename "$selected" | tr . _)

# Step 5: Check if tmux is running
tmux_running=$(pgrep tmux)

# Step 6: Start tmux if not running
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

# Step 7: Create a new session if it doesn't exist
if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

# Step 8: Switch to the session
tmux switch-client -t $selected_name
