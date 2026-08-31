#!/bin/sh

die() { echo "ERROR: $*" >&2; exit 1; }
command_required() { command -v "$1" >/dev/null 2>&1 || die "required command not found: $1"; }

derive_hex() {
    printf '%s:%s' "$level_HASH" "$1" | sha256sum | awk '{print $1}'
}

answer_token() {
    length=$1
    printf '%s' "$(derive_hex answer)" | base64 | tr -d '\r\n=' | tr '+/' '-_' | cut -c "1-$length"
}

rot13() {
    tr 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' 'nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM'
}

write_readme() {
    instructions=$1
    {
        printf '%s\n' "$instructions"
        echo "Submit the requested answer through the external form."
    } > "$LEVEL_HOME/README.txt"
}

finish_level() {
    [ "${SKIP_OWNERSHIP:-0}" -eq 1 ] && return
    chown -R "$levelToBuild:$levelToBuild" "$LEVEL_HOME"
    chmod 700 "$LEVEL_HOME"
}

# Level scripts run in fresh shells.
. "$INSTALL_ROOT/polylinux-common.sh"
