#!/usr/bin/env bash
# Render a short test video with FFmpeg (proves the Actions video pipeline works).
# Usage: ./render.sh [seconds]
set -euo pipefail
DUR="${1:-5}"
mkdir -p out
ffmpeg -y -loglevel error \
  -f lavfi -i "testsrc2=size=1280x720:rate=30:duration=${DUR}" \
  -f lavfi -i "sine=frequency=440:duration=${DUR}" \
  -shortest -c:v libx264 -pix_fmt yuv420p -c:a aac out/test.mp4
echo "Rendered out/test.mp4 (${DUR}s)"
ls -lh out/test.mp4
