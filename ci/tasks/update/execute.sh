#!/bin/bash

set -eu -o pipefail

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../../../.."

export GIT_COMMITTER_NAME=Concourse
export GIT_COMMITTER_EMAIL=concourse.ci@localhost
export GIT_AUTHOR_NAME="${GIT_AUTHOR_NAME:-$GIT_COMMITTER_NAME}"
export GIT_AUTHOR_EMAIL="${GIT_AUTHOR_EMAIL:-$GIT_COMMITTER_EMAIL}"

git clone --quiet file://$PWD/repo repo-output

export GIT_REMOTE_URI=$( cd repo ; git remote get-url origin )

cd repo-output

./bin/all
