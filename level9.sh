#!/bin/sh
set -eu
. "$INSTALL_ROOT/resources.sh"
answer=$(answer_token 12)
{
  printf 'COMPLETED duplicate-a\n%.0s' 1 2
  printf 'PENDING ignore-me\n%.0s' 1 2
  echo "COMPLETED millionth $answer"
  printf 'COMPLETED duplicate-b\n%.0s' 1 2 3
} > "$LEVEL_HOME/my_psswd"
write_readme "Filter my_psswd for COMPLETED, then sort and use uniq -u. Submit only the 12-character value after millionth."
finish_level
