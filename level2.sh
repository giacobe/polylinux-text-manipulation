#!/bin/sh
set -eu
. "$INSTALL_ROOT/resources.sh"
answer=$(answer_token 12)
status=$(theme_field status)
event=$(theme_field event)
{
  printf '%s\n' "$status" "$status" "$status" "$status" "$status"
  printf '%s\n' "$answer"
  printf '%s\n' "$event" "$event" "$event" "$event"
} > "$LEVEL_HOME/my_psswd"
write_readme "Use uniq on my_psswd. Adjacent repeated lines are noise; submit the single 12-character Base64url code. Case matters."
finish_level
