# TwistFrame Publisher — public site (DEPLOYED)

Live on GitHub Pages (free). Two copies so any TikTok verification method works:

| URL | repo |
|---|---|
| **https://ilyasaffonovv-commits.github.io/** | `ilyasaffonovv-commits/ilyasaffonovv-commits.github.io` |
| https://ilyasaffonovv-commits.github.io/twistframe-publisher/ | `ilyasaffonovv-commits/twistframe-publisher` |

### The three URLs for TikTok (use the apex ones)

```
Web/Desktop URL     : https://ilyasaffonovv-commits.github.io/
Privacy Policy URL  : https://ilyasaffonovv-commits.github.io/privacy.html
Terms of Service URL: https://ilyasaffonovv-commits.github.io/terms.html
```

### Editing content

Edit `index.html` / `privacy.html` / `terms.html` here, then:

```bash
cd publisher/site
git add -A && git commit -m "edit" && git push origin main && git push apex main --force
```

Both sites rebuild in ~1-2 min.

### TikTok "Verify URL properties"

* **Signature file** (most common): save the `tiktok*.txt` file TikTok gives you
  into this folder and run `bash tiktok-verify.sh`. It deploys to both sites; the
  file lands at `https://ilyasaffonovv-commits.github.io/<name>.txt`.
* **Meta tag**: paste the `<meta name="tiktok-developers-site-verification" ...>`
  tag onto the marked line near the top of `index.html`, then push (command
  above).
* **DNS TXT**: not possible on `github.io` — use one of the two methods above.
