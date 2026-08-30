#!/bin/sh
set -eu
. "$INSTALL_ROOT/resources.sh"
answer=$(answer_token 12)
encoded=$(printf '%s' "rightcode:$answer" | rot13)
{
  printf 'abg-lrg\n%.0s' 1 2 3
  echo "$encoded"
  printf 'fgnaq-ol\n%.0s' 1 2
} > "$LEVEL_HOME/my_psswd"
write_readme "Use uniq to remove adjacent repeats, then use tr to apply ROT13. Submit only the 12-character value after rightcode:."
finish_level
