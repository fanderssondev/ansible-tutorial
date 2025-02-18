#!/bin/bash

# ==========================
# TMUX Ansible Session Manager
# ==========================
# This script creates a tmux session named "ansible" with multiple windows.
# It allows optional SSH connections upon creation and can terminate the session.
#
# Dependencies:
# - tmux
#
# Usage:
#   - Start a new tmux session: ./script.sh
#   - Start session and SSH into all machines: ./script.sh -c
#   - Close session and disconnect SSH: ./script.sh -d
#   - Note: Running with `-d` will terminate all windows in the session.
#
# Author: Fredrik Andersson
# Github: https://github.com/fanderssondev/dotfiles/
# ==========================


# Session name
SESSION="ansible"

# Check for -c and -d flags
RUN_SSH=false
CLOSE_SESSION=false
while getopts "cd" opt; do
  case $opt in
    c)
      RUN_SSH=true
      ;;
    d)
      CLOSE_SESSION=true
      ;;
  esac
done

if [ "$CLOSE_SESSION" = true ]; then
  # Detach any SSH sessions
  for window in $(tmux list-windows -t $SESSION -F "#I"); do
    tmux send-keys -t $SESSION:$window "exit" C-m
  done
  # Kill the tmux session
  tmux kill-session -t $SESSION
  exit 0
fi

# Start a new tmux session, explicitly setting the first window
tmux new-session -d -s $SESSION -n ansible

declare -A WINDOWS
WINDOWS=(
  [2]="rocky8a"
  [3]="rocky8b"
  [4]="rocky8c"
  [5]="ubuntu24a"
)

for index in "${!WINDOWS[@]}"; do
  tmux new-window -t $SESSION:$index -n "${WINDOWS[$index]}"
  if [ "$RUN_SSH" = true ]; then
    tmux send-keys -t $SESSION:$index "ssh ${WINDOWS[$index]}" C-m
  fi
done

# Attach to session
tmux attach -t $SESSION

