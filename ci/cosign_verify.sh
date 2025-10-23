#!/usr/bin/env bash
# Verify signed image with cosign
IMAGE=$1
if [ -z "$IMAGE" ]; then
  echo "Usage: $0 <image>"
  exit 1
fi
# Requires cosign installed and COSIGN_PASSWORD or key configured
cosign verify $IMAGE || { echo "Verification failed"; exit 2; }
echo "Verification OK"
