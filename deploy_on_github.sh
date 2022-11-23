#!/bin/bash
cd -- "$(dirname "$BASH_SOURCE")"
rm -rf docs
cd theme_stack
cp public ../docs

cd ..
git add .
git commit -m "website update"
git push
