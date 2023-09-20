#!/bin/bash

dark_or_light_mode() {
  defaults read -g AppleInterfaceStyle 2> /dev/null || echo "Light"
}

# Toggles darkmode in system and terminal 
darkmode() {
  # first toggle system dark/light mode
  $(osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode')

  # then read what current/new is
  CURR_MODE=$(dark_or_light_mode)

  # then set theme in kitty
  if [ "$CURR_MODE" = "Light" ]; then
    set_light
  else 
    echo "Setting dark"
    set_dark
  fi
}

set_dark() {
    $(osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true')
    kitty @ set-colors -a -c "$HOME/.config/kitty/argonaut-theme.conf"
}

set_light() {
    $(osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to false')
    kitty @ set-colors -a -c "$HOME/.config/kitty/solarized-light-theme.conf"
}

theme() {
  if [ -z $1 ]; then 
    # no parameter means it's just a toggle
    darkmode
  elif [[ $1 == "dark" ]]; then
    set_dark
  elif [[ $1 == "light" ]]; then
    set_light
  fi
}
