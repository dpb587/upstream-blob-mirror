#!/bin/bash

set -eu -o pipefail

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../../.."

export GIT_COMMITTER_NAME=Concourse
export GIT_COMMITTER_EMAIL=concourse@localhost
export GIT_AUTHOR_NAME="${GIT_AUTHOR_NAME:-$GIT_COMMITTER_NAME}"
export GIT_AUTHOR_EMAIL="${GIT_AUTHOR_EMAIL:-$GIT_COMMITTER_EMAIL}"

git clone --quiet file://$PWD/repo repo-output

cd repo-output

./bin/all

git add .
git commit -m "Update repositories" || true
