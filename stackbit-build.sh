#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e797e08a09a45001440462c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e797e08a09a45001440462c
curl -s -X POST https://api.stackbit.com/project/5e797e08a09a45001440462c/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e797e08a09a45001440462c/webhook/build/publish > /dev/null
