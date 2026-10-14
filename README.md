# Boulder Digital Media — static site for Netlify

Plain HTML/CSS. No build step.

## 1. Pull the images (do this while Yola is still live)
    bash fetch-images.sh
Saves all 42 images into `images/`. Any that fail are listed so you can save them by hand.

## 2. Deploy
Push this folder to a GitHub repo and import it in Netlify. Or drag the folder onto app.netlify.com/drop.
Publish directory: `.`  Build command: leave empty.

## 3. Turn on the contact form
Netlify → Site → Forms → enable form detection, then redeploy.
Add an email notification to info@boulderdigitalmedia.com under Forms → Notifications.

## 4. Point the domain
Add `www.boulderdigitalmedia.com` and the apex domain in Netlify → Domain management.
Update the DNS records at Cloudflare. Keep Yola running until the Netlify version is checked.

## URLs
Old `.php` pages 301-redirect to clean URLs (`_redirects`).
`/Privacy-Policy.php` still works in place, because the Shopify app listing links to it.
