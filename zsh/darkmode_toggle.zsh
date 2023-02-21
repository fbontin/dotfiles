#!/bin/bash

# Toggles darkmode in system and terminal 
darkmode() {
  # first toggle system dark/light mode
  $(osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode')

  # then read what current/new is
  CURR_MODE=$(defaults read -g AppleInterfaceStyle 2> /dev/null || echo "Light")

  if [ "$CURR_MODE" = "Light" ]; then
    echo "Setting light"
    kitty @ set-colors -a -c "$HOME/.config/kitty/solarized-light-theme.conf"
  else 
    echo "Setting dark"
    kitty @ set-colors -a -c "$HOME/.config/kitty/glacier-theme.conf"
  fi
}
