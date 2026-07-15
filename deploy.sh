#!/bin/bash
# deploy.sh — Pull latest images and restart Stoat services
set -euo pipefail
cd "$(dirname "$0")"
echo "=== Pulling latest images from ghcr.io ==="
docker compose pull
echo "=== Restarting services ==="
docker compose up -d --remove-orphans
echo "=== Done at $(date) ==="
docker compose ps --format "table {{.Name}}\t{{.Image}}\t{{.Status}}"
