#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db9d830d7995f001f89f779/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db9d830d7995f001f89f779
curl -s -X POST https://api.stackbit.com/project/5db9d830d7995f001f89f779/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5db9d830d7995f001f89f779/webhook/build/publish > /dev/null
