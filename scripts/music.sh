#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

main() {
  spotify_output="$($CURRENT_DIR/tmux-spotify-info/tmux-spotify-info)"
  trimmed_output=$(echo "$spotify_output" | tr -d '[:space:]')
  if [ -z "$trimmed_output" ]; then
    echo "Richie-Z "
  else
    $CURRENT_DIR/tmux-spotify-info/tmux-spotify-info
  fi
}

main
