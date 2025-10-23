#!/usr/bin/env bash
set -e
ZIP_NAME="tradingbot_pro_full_v2.zip"
DEST="gdrive:ABTPi18n/"
if [ ! -f "$ZIP_NAME" ]; then
  echo "Error: $ZIP_NAME not found in current directory."
  exit 1
fi
if ! command -v rclone &> /dev/null; then
  echo "Installing rclone (requires sudo)..."
  sudo apt update && sudo apt install -y rclone
fi
if ! rclone listremotes | grep -q "gdrive:"; then
  echo "Configure rclone remote 'gdrive' for your Google Drive now."
  rclone config
fi
rclone copy "$ZIP_NAME" "$DEST" --progress
echo "Upload completed to $DEST"
