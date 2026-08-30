#!/bin/sh
set -eu
. "$INSTALL_ROOT/resources.sh"
answer=$(answer_token 12)
encoded=$(printf '%s' "rightcode:$answer" | rot13)
{
  printf 'abvfr-n\n%.0s' 1 2
  printf '%s\n' "$encoded"
  printf 'abvfr-o\n%.0s' 1 2 3
  printf 'abvfr-p\n%.0s' 1 2
} > "$LEVEL_HOME/my_psswd"
write_readme "Sort my_psswd, use uniq -u, and apply ROT13. Submit only the 12-character value after rightcode:."
finish_level
