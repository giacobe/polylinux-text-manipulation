#!/bin/sh
set -eu
. "$INSTALL_ROOT/resources.sh"
answer=$(answer_token 12)
event=$(theme_field event)
{
  echo "INFO $(theme_field status)"
  echo "NOTICE $event $answer"
  echo "INFO $(theme_field service)"
  echo "WARNING review_pending"
} > "$LEVEL_HOME/my_psswd"
write_readme "Use grep to find the one NOTICE line in my_psswd. Submit only its final 12-character Base64url field. Case matters."
finish_level
