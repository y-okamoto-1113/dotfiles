#!/bin/sh -eux

curl -fsSL https://bun.sh/install | bash
exec /bin/zsh

bun install -g serverless typescript ts-node @types/node
