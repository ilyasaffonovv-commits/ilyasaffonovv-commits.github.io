#!/usr/bin/env bash
# Deploy a TikTok "URL properties" signature file to the published site.
#
# When TikTok shows you a signature file (e.g. tiktokXXXXXXXX.txt), either:
#   * save it into this folder and run:   bash tiktok-verify.sh
#   * or pass its path:                   bash tiktok-verify.sh ~/Downloads/tiktokXXXX.txt
#
# Then click "Verify" in the TikTok portal. The file becomes reachable at:
#   https://ilyasaffonovv-commits.github.io/<name>.txt
set -euo pipefail
cd "$(dirname "$0")"

[ "${1:-}" ] && cp -f "$1" "./$(basename "$1")"

SIGS=$(ls tiktok*.txt 2>/dev/null || true)
if [ -z "$SIGS" ]; then
  echo "No tiktok*.txt file in $(pwd). Save the file TikTok gave you here and re-run." >&2
  exit 1
fi
echo "signature file(s): $SIGS"

git add -A
git -c user.name="ilyasaffonovv-commits" -c user.email="ilya.saffonovv@gmail.com" \
    commit -q -m "TikTok URL verification signature" || echo "(nothing to commit)"
git push -q origin main

echo
echo "pushed. GitHub Pages rebuilds in ~1-2 min. The file will be at:"
for s in $SIGS; do echo "  https://ilyasaffonovv-commits.github.io/$s"; done
