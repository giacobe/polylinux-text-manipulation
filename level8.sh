#!/bin/sh
set -eu
. "$INSTALL_ROOT/resources.sh"
answer=$(answer_token 12)
{
  printf 'zeta noise\n%.0s' 1 2
  printf 'middle noise\n%.0s' 1 2 3
  echo "00-answer $answer"
  printf 'alpha-decoy noise\n%.0s' 1 2
} > "$LEVEL_HOME/my_psswd"
write_readme "Use sort, uniq, and head so the 00-answer line becomes the first unique line. Submit its final 12-character value."
finish_level
