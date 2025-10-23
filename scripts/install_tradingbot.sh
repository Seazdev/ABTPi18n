#!/usr/bin/env bash
set -euo pipefail
echo "Trading Bot Pro - Automated Installer (Dev mode)"
if ! command -v docker-compose &> /dev/null; then
  echo "Please install docker-compose."
  exit 1
fi
docker-compose up -d --build
echo "Services started. Visit http://localhost:8000/health"
