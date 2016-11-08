#!/bin/sh

set -eu

cd plugged

for dir in *; do
    git add "$dir/"
    git add "$dir/" -u
    cd "$dir"
    hash="$(git rev-parse HEAD)"
    cd ..
    if [ "$(git diff --cached)" != "" ]; then
        git commit -m "Update $dir to $hash"
    fi
done

