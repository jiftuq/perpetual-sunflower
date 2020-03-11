#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e68fb34044ddc001b352349/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e68fb34044ddc001b352349
curl -s -X POST https://api.stackbit.com/project/5e68fb34044ddc001b352349/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e68fb34044ddc001b352349/webhook/build/publish > /dev/null
