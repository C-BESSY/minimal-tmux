#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bg="#d7d787"
status="bottom"
justify="centre"
indicator="#S"
window_status_format=' #I:#W '
status_right="#($CURRENT_DIR/scripts/tmux-spotify-info/tmux-spotify-info) | Richie-Z"
status_left="#[bg=default,fg=default,bold]#{?client_prefix,,${indicator}}#[bg=${bg},fg=black,bold]#{?client_prefix,${indicator},}#[bg=default,fg=default,bold]"
expanded_icon="󰊓 "
show_expanded_icon_for_all_tabs=true

tmux set-option -g status-position ${status}
tmux set-option -g status-style bg=default,fg=default
tmux set-option -g status-justify ${justify}
tmux set-option -g status-left "${status_left}"
tmux set-option -g status-right "${status_right}"
tmux set-option -g window-status-format "${window_status_format}"
tmux set-option -g window-status-current-format "#[bg=${bg},fg=#000000] ${window_status_format}#{?window_zoomed_flag,${expanded_icon}, }"

if [ "$show_expanded_icon_for_all_tabs" = true ]; then
	tmux set-option -g window-status-format " ${window_status_format}#{?window_zoomed_flag,${expanded_icon}, }"
fi
