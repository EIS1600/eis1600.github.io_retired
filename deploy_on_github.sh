#!/bin/bash
cd -- "$(dirname "$BASH_SOURCE")"
#rm -rf docs
mv ./theme_stack/public docs

git add .
git commit -m "website update"
git push
