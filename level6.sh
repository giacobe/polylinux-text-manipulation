#!/bin/sh
set -eu
. "$INSTALL_ROOT/resources.sh"
answer=$(answer_token 12)
{
  printf 'decoy-alpha\n%.0s' 1 2 3
  printf 'decoy-beta\n%.0s' 1 2
  echo "RightCode: $answer"
  printf 'decoy-gamma\n%.0s' 1 2 3 4
} > "$LEVEL_HOME/my_psswd"
write_readme "Use sort and uniq -u together on my_psswd to isolate the only line that occurs once. Submit only the value after RightCode:."
finish_level
