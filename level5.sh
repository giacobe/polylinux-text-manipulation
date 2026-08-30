#!/bin/sh
set -eu
. "$INSTALL_ROOT/resources.sh"
answer=$(answer_token 12)
{
  echo "middle $(theme_field project)"
  echo "alpha $(theme_field asset)"
  echo "z-final $answer"
  echo "delta $(theme_field event)"
} > "$LEVEL_HOME/my_psswd"
write_readme "Sort my_psswd alphabetically. The last line begins z-final. Submit its final 12-character Base64url value."
finish_level
