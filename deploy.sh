#!/bin/sh

set -eu

if [ -n "$TRAVIS_TAG" ]; then
    EXTRA_ARGS=
else
    EXTRA_ARGS="--force -l testing"
fi
for package in $@; do
    anaconda -t "$CONDA_UPLOAD_TOKEN" upload --user "$ANACONDA_USER" $package $EXTRA_ARGS
done
