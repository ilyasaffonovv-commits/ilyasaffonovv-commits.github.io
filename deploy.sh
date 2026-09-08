#!/usr/bin/env bash
# Deploy the TwistFrame Publisher site to GitHub Pages (free).
# Prereq: `gh auth login` completed once.
#
#   bash deploy.sh              # create/update repo + enable Pages
#   bash deploy.sh --update     # just push changes to an existing repo
#
set -euo pipefail
cd "$(dirname "$0")"

REPO_NAME="${TFPUB_SITE_REPO:-twistframe-publisher}"

if ! gh auth status >/dev/null 2>&1; then
  echo "ERROR: not logged in to GitHub. Run:  gh auth login" >&2
  exit 1
fi
USER="$(gh api user --jq .login)"
echo "GitHub user: $USER"
echo "Repo:        $USER/$REPO_NAME"

if [ ! -d .git ]; then
  git init -q
  git checkout -q -b main 2>/dev/null || git branch -M main
fi
git add -A
git -c user.name="${GIT_AUTHOR_NAME:-$USER}" \
    -c user.email="${GIT_AUTHOR_EMAIL:-$USER@users.noreply.github.com}" \
    commit -q -m "TwistFrame Publisher site" || echo "(nothing to commit)"

if gh repo view "$USER/$REPO_NAME" >/dev/null 2>&1; then
  echo "repo exists — pushing"
  git remote get-url origin >/dev/null 2>&1 || \
    git remote add origin "https://github.com/$USER/$REPO_NAME.git"
  git push -q -u origin main --force-with-lease || git push -q -u origin main --force
else
  echo "creating public repo"
  gh repo create "$USER/$REPO_NAME" --public --source=. --remote=origin --push
fi

# enable GitHub Pages from main / root (idempotent)
gh api --method POST "repos/$USER/$REPO_NAME/pages" \
  -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 \
  || gh api --method PUT "repos/$USER/$REPO_NAME/pages" \
       -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 \
  || echo "(Pages may already be enabled)"

URL="https://$USER.github.io/$REPO_NAME/"
echo
echo "================================================================"
echo "  LIVE (allow 1-3 min for the first build):"
echo "    Home    : $URL"
echo "    Terms   : ${URL}terms.html"
echo "    Privacy : ${URL}privacy.html"
echo "================================================================"
echo "$URL" > .deployed_url
