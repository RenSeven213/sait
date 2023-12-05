#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'New Deployment'
git push -f git@github.com:<RenSeven213>/<RenSeven213>.github.io.git master

cd -