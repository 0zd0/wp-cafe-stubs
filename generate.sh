#!/usr/bin/env bash
#
# Generate WP Cafe stubs from the source directory.
#

HEADER=$'/**\n * Generated stub declarations for WP Cafe.\n * @see https://product.themewinter.com/wpcafe\n * @see https://github.com/0zd0/wp-cafe-stubs\n */'

FILE="wp-cafe-stubs.phpstub"
DIR=$(dirname "$0")

IGNORE_HOOKS=(
)
IGNORE_HOOKS_STRING=$(IFS=,; echo "${IGNORE_HOOKS[*]}")

set -e

test -f "$FILE" || touch "$FILE"
test -d "source/wp-cafe"

"$DIR/vendor/bin/generate-hooks" \
    --input=source/wp-cafe \
    --input=source/overrides \
    --output=hooks \
    --ignore-hooks="$IGNORE_HOOKS_STRING"

"$DIR/vendor/bin/generate-stubs" \
    --force \
    --finder=finder.php \
    --header="$HEADER" \
    --functions \
    --classes \
    --interfaces \
    --traits \
    --constants \
    --out="$FILE"