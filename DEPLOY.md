# TwistFrame Publisher — public site for TikTok URL verification

TikTok requires every app created after 2024-09-09 to have a **verified**
Terms of Service URL, Privacy Policy URL and Web/Desktop URL. This folder is a
tiny 3-page static site that satisfies that. Hosting is **free** on GitHub Pages.

## Files

| file | becomes |
|---|---|
| `index.html` | the app's Web/Desktop URL |
| `terms.html` | Terms of Service URL |
| `privacy.html` | Privacy Policy URL |
| `.nojekyll` | makes GitHub Pages serve dot-files (needed for the TikTok signature file) |
| `deploy.sh` | one-command deploy |

The contact address on all three pages is `safonov.creator@gmail.com` — change it
in the `.html` files first if you want a different one.

## Deploy (after `gh auth login`)

```bash
bash publisher/site/deploy.sh
```

It creates a public repo `twistframe-publisher` on your GitHub account, pushes
these files, and enables GitHub Pages. Live within ~1-3 minutes at:

```
https://<your-github-username>.github.io/twistframe-publisher/
https://<your-github-username>.github.io/twistframe-publisher/terms.html
https://<your-github-username>.github.io/twistframe-publisher/privacy.html
```

## TikTok "Verify URL properties"

In the TikTok developer portal, add the three URLs above, then verify by
**URL prefix**:

1. Enter the prefix `https://<your-username>.github.io/twistframe-publisher/`.
2. TikTok gives you a signature file, e.g. `tiktokXXXXXXXXXXXX.txt`.
3. Put that file in this `site/` folder and run:
   ```bash
   bash publisher/site/deploy.sh --update
   ```
   (or just: `git -C publisher/site add -A && git -C publisher/site commit -m sig && git -C publisher/site push`)
4. Back in TikTok, click **Verify**. The file is served at
   `https://<your-username>.github.io/twistframe-publisher/tiktokXXXXXXXXXXXX.txt`.

If TikTok instead offers a **meta-tag** method, paste the tag into the marked
line near the top of `index.html` and redeploy.
