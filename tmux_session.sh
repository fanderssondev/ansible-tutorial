#!/bin/bash

# Session name
SESSION="ansible"

# Start a new tmux session
tmux new-session -d -s $SESSION -n ansible

# Create additional windows
tmux new-window -t $SESSION:1 -n rocky8a
tmux new-window -t $SESSION:2 -n rocky8b
tmux new-window -t $SESSION:3 -n rocky8c

# Attach to session
tmux attach -t $SESSION
