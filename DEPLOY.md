# TwistFrame Publisher — public site (DEPLOYED)

Live on GitHub Pages (free), served from repo
`ilyasaffonovv-commits/ilyasaffonovv-commits.github.io`.
(The `twistframe-publisher` repo is kept as a code backup; its Pages is disabled.)

### The three URLs registered with TikTok

```
Web/Desktop URL      : https://ilyasaffonovv-commits.github.io/
Privacy Policy URL   : https://ilyasaffonovv-commits.github.io/privacy.html
Terms of Service URL : https://ilyasaffonovv-commits.github.io/terms.html
```
All three: **Verified** in the TikTok portal (URL-prefix method,
`https://ilyasaffonovv-commits.github.io/`).

### Editing content

Edit `index.html` / `privacy.html` / `terms.html` here, then:

```bash
cd publisher/site
git add -A && git commit -m "edit" && git push origin main
```
Rebuilds in ~1-2 min.

### TikTok "Verify URL properties" (already done, kept for reference)

* **Signature file**: save the `tiktok*.txt` file TikTok gives you into this
  folder and run `bash tiktok-verify.sh`. It lands at
  `https://ilyasaffonovv-commits.github.io/<name>.txt`.
  (Current file: `tiktokqFg4p3tw8jVxjPhbF01bEFC7WflmvMzY.txt`.)
* **Meta tag**: paste the `<meta name="tiktok-developers-site-verification" ...>`
  tag onto the marked line near the top of `index.html`, then push.
* **DNS TXT**: not possible on `github.io`.
