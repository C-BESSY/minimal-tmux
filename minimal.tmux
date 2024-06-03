#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bg="#d7d787"

status="bottom"
justify="absolute-centre"

status_left=" #S "
status_left_formated="#[bg=default,fg=default,bold]#{?client_prefix,,${status_left}}#[bg=${bg},fg=black,bold]#{?client_prefix,${status_left},}#[bg=default,fg=default,bold]"
status_left_length=25

# status_right="#($CURRENT_DIR/scripts/tmux-cpu/scripts/cpu_percentage.sh) | #($CURRENT_DIR/scripts/music.sh)"
status_right="#($CURRENT_DIR/scripts/tmux-cpu/scripts/cpu_percentage.sh) | Richie-Z "
status_right_formated="#[bg=default,fg=default,bold]#{?client_prefix,,${status_right}}#[bg=${bg},fg=black,bold]#{?client_prefix,${status_right},}#[bg=default,fg=default,bold]"
status_right_length=70

window_status_format=' #I:#W '
expanded_icon="󰊓 "

title="#S:#W"

tmux set-option -g status-position ${status}
tmux set-option -g status-style bg=default,fg=default
tmux set-option -g status-justify ${justify}

tmux set-option -g status-left "${status_left_formated}"
tmux set-option -g status-left-length "${status_right_length}"
tmux set-option -g status-right "${status_right_formated}"
tmux set-option -g status-right-length "${status_right_length}"

tmux set-option -g set-titles-string "${title}"

tmux set-option -g window-status-format " ${window_status_format}#{?window_zoomed_flag,${expanded_icon}, }"
tmux set-option -g window-status-current-format "#[bg=${bg},fg=#000000] ${window_status_format}#{?window_zoomed_flag,${expanded_icon}, }"
