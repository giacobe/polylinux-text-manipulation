#!/bin/sh
set -eu
cd "$(dirname "$0")"
INSTALL_ROOT=$(pwd)
LAB_ID=polylinux-text-manipulation
USER_ID=student@example.edu
currentDate=2026-08-30
SYSTEM_PASSWORD=systemPassword
LEVEL_PASSWORD_ROOT=levelPassword
EXERCISE_CODE=13527DE
SKIP_OWNERSHIP=1
export INSTALL_ROOT LAB_ID USER_ID currentDate SYSTEM_PASSWORD LEVEL_PASSWORD_ROOT EXERCISE_CODE SKIP_OWNERSHIP
. ./resources.sh
select_theme
export THEME_INDEX

work=$(mktemp -d "${TMPDIR:-/tmp}/polylinux-text.XXXXXX")
cleanup() { case "$work" in "${TMPDIR:-/tmp}"/polylinux-text.*) rm -rf "$work" ;; esac; }
trap cleanup EXIT INT TERM

levelnumber=1
while [ "$levelnumber" -le 10 ]; do
    levelToBuild=level$levelnumber
    LEVEL_HOME=$work/$levelToBuild
    levelPassword=${LEVEL_PASSWORD_ROOT}${levelnumber}
    mkdir -p "$LEVEL_HOME"
    level_HASH=$(level_seed_v1)
    export levelnumber levelToBuild LEVEL_HOME levelPassword level_HASH
    sh "./level$levelnumber.sh"
    [ -s "$LEVEL_HOME/README.txt" ]
    levelnumber=$((levelnumber + 1))
done

expected_for() {
    levelnumber=$1; levelToBuild=level$levelnumber; levelPassword=${LEVEL_PASSWORD_ROOT}${levelnumber}
    level_HASH=$(level_seed_v1); export levelnumber levelToBuild levelPassword level_HASH
    answer_token 12
}

[ "$(rot13 < "$work/level1/my_psswd")" = "$(theme_field asset)" ]
[ "$(uniq -u "$work/level2/my_psswd")" = "$(expected_for 2)" ]
[ "$(grep NOTICE "$work/level3/my_psswd" | awk '{print $NF}')" = "$(expected_for 3)" ]
[ "$(head -n 20 "$work/level4/my_psswd" | grep EARLY-CODE | awk '{print $2}')" = "$(expected_for 4)" ]
[ "$(sort "$work/level5/my_psswd" | tail -n 1 | awk '{print $2}')" = "$(expected_for 5)" ]
[ "$(sort "$work/level6/my_psswd" | uniq -u | awk '{print $2}')" = "$(expected_for 6)" ]
[ "$(uniq "$work/level7/my_psswd" | rot13 | grep rightcode | cut -d: -f2)" = "$(expected_for 7)" ]
[ "$(sort "$work/level8/my_psswd" | uniq | head -n 1 | awk '{print $2}')" = "$(expected_for 8)" ]
[ "$(grep COMPLETED "$work/level9/my_psswd" | sort | uniq -u | awk '{print $3}')" = "$(expected_for 9)" ]
[ "$(sort "$work/level10/my_psswd" | uniq -u | rot13 | grep rightcode | cut -d: -f2)" = "$(expected_for 10)" ]

echo 'All ten deterministic fixtures and intended solution paths passed.'
