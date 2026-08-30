#!/bin/sh
set -eu
. "$INSTALL_ROOT/resources.sh"
answer=$(theme_field asset)
printf '%s\n' "$answer" | rot13 > "$LEVEL_HOME/my_psswd"
printf '%s\n' "ROT13: translate A-Z and a-z by 13 positions" > "$LEVEL_HOME/key.txt"
write_readme "Use tr with the ROT13 key to decode my_psswd. Submit the decoded lowercase themed word. Underscores, if present, are part of the answer."
finish_level
