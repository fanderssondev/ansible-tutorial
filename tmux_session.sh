#!/bin/bash

# Session name
SESSION="ansible"

# Start a new tmux session, explicitly setting the first window
tmux new-session -d -s $SESSION -n ansible

# Create additional windows
tmux new-window -t $SESSION:2 -n rocky8a
tmux new-window -t $SESSION:3 -n rocky8b
tmux new-window -t $SESSION:4 -n rocky8c
tmux new-window -t $SESSION:5 -n ubuntu24a

# Attach to session
tmux attach -t $SESSION

