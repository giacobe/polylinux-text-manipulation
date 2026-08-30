#!/bin/sh
set -eu
. "$INSTALL_ROOT/resources.sh"
answer=$(answer_token 12)
{
  i=1; while [ "$i" -le 8 ]; do echo "note-$i $(theme_field status)"; i=$((i+1)); done
  echo "EARLY-CODE $answer"
  i=10; while [ "$i" -le 40 ]; do echo "note-$i archived"; i=$((i+1)); done
} > "$LEVEL_HOME/my_psswd"
write_readme "The answer is near the beginning of my_psswd. Use head to find EARLY-CODE, then submit only its 12-character value."
finish_level
