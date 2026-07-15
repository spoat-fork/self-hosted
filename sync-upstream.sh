#!/bin/bash
# sync-upstream.sh — Manually trigger upstream sync on all forks
# Usage: bash ~/stoat/sync-upstream.sh
set -euo pipefail
ORG="spoat-fork"
echo "Triggering upstream sync on all forks..."
for REPO in stoatchat self-hosted for-web for-desktop; do
  echo "  Dispatching sync for $ORG/$REPO..."
  gh workflow run upstream-sync.yml --repo "$ORG/$REPO" 2>&1 \
    && echo "    ✓ Triggered" \
    || echo "    ⚠ Failed (workflow may not be available yet)"
done
echo ""
echo "Check sync PRs at:"
echo "  https://github.com/orgs/$ORG/repositories"
