#!/usr/bin/env bash
set -euo pipefail
echo "Trading Bot Pro automated installer - simplified demo"
CMD=${1:-"--local"}
echo "Mode: $CMD"
# Pre-checks
command -v docker >/dev/null 2>&1 || { echo "docker is required"; exit 1; }
command -v docker-compose >/dev/null 2>&1 || { echo "docker-compose is required"; exit 1; }
# Bring up
docker-compose -f docker-compose.yml up -d --build
echo "Waiting for services..."
sleep 5
docker-compose -f docker-compose.yml ps
echo "Done. Run health checks at http://localhost:8000/health"
