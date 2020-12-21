#!/usr/bin/env bash

if git diff-index --quiet HEAD --; then
    echo "You have committed every changes necessary to go forward. Good! Just to be sure git push is being called"
    git push
else
    echo "There are changes you have not committed, and therefore you cannot make packages right now."
    echo "Please commit your changes before you try to update the helm repo"
    exit 1
fi

for dir in */ ; do
    helm package $dir
done
echo "Packages are made";
git checkout gh-pages
git ls-files --others --exclude-standard | grep '\.tgz$' | xargs git add $1
message=$(git ls-files --others --exclude-standard | grep '\.tgz$')
helm repo index --url https://observertc.github.io/helm/ .
git commit -a -m $message
git push
git checkout main