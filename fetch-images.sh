#!/usr/bin/env bash
# Pulls every image the new site needs from the live Yola site into ./images.
# Run once from this folder BEFORE the Yola site is switched off:
#   bash fetch-images.sh
set -u
cd "$(dirname "$0")"
B="https://www.boulderdigitalmedia.com/resources"
fail=0
get() { # url  local-path
  mkdir -p "images/$(dirname "$2")"
  if curl -fsSL "$1" -o "images/$2"; then echo "ok   $2"; else echo "FAIL $2  <- $1"; fail=1; fi
}

# Home
get "$B/Shopify%20Experts%20Logo2.png"                        shopify-experts.png
get "$B/Google%20Partner%20copy"                              google-partner.png
get "$B/Facebook%20Partner.png"                               facebook-partner.png
get "$B/wordpress%20partner.png"                              wordpress-partner.png
get "$B/Bamboobies_Logo-01_480x.png"                          bamboobies-logo.png
get "$B/giftcard.png.opt324x185o0%2C0s324x185.png"            kanga-care-logo.png
get "$B/SimpleWishes_3drops-01.png"                           simple-wishes-logo.png

# Website design — portfolio
get "$B/bjornscohoney.jpg"                                    portfolio/bjorns-colorado-honey.jpg
get "$B/simplewishes.jpg"                                     portfolio/simplewishes.jpg
P="$B/marketing_slider/data1/images"
get "$P/sctechnologysolutions.png"                            portfolio/sc-technology-solutions.png
get "$P/tulaboutique.png"                                     portfolio/tula-boutique.png
get "$P/bamboobies.png"                                       portfolio/bamboobies.png
get "$P/engineerednow.png"                                    portfolio/engineered-now.png
get "$P/grafxgroup.jpg"                                       portfolio/grafx-group.jpg
get "$P/jlessencials.png"                                     portfolio/jl-essencials.png
get "$P/lafes.jpg"                                            portfolio/lafes.jpg
get "$P/saavynaturals.jpg"                                    portfolio/saavy-naturals.jpg
get "$P/vivari.jpg"                                           portfolio/vivari-menswear.jpg

# Website design — platforms
get "$B/wp-logo.jpg"                                          platforms/wordpress.jpg
get "$B/squarespace_logo.png"                                 platforms/squarespace.png
get "$B/Shopify-logo.jpg"                                     platforms/shopify.jpg
get "$B/big_commerce_logo.png"                                platforms/bigcommerce.png
get "$B/Magento_logo.jpeg"                                    platforms/magento.jpeg
get "$B/mailchimp-addon.png"                                  platforms/mailchimp.png

# Digital marketing
get "$B/BDM_DigMktEcos_CircleFlow_LOGO.png"                   digital-marketing-ecosystem.png
for p in linkedin facebook twitter gleam drip mailchimp google; do get "$B/$p.jpg" "partners/$p.jpg"; done
get "$B/Instagram.jpg"                                        partners/instagram.jpg

# Media production
get "$B/matthias-oberholzer-9McgL99YbV8-unsplash.jpg.opt410x273o0%2C0s410x273.jpg" media-production.jpg

# Graphic design
G="$B/graphic_design/data1/images"
get "$G/150_off_new_year_sale_2.jpg"                          graphic-design/150-off-new-year-sale.jpg
get "$G/screenshot20141009at9.00.17am.png"                    graphic-design/web-design-sample-1.png
get "$G/travel_agent_woman_airport_illustration_v2.jpg"       graphic-design/travel-agent-illustration.jpg
get "$G/mobile_djd_mock_up_1018.png"                          graphic-design/mobile-mockup.png
get "$G/fgt_weblogo_v2.png"                                   graphic-design/fgt-web-logo.png
get "$G/screen_shot_20191230_at_4.33.12_pm.png"               graphic-design/web-design-sample-2.png
get "$G/screenshot20141009at9.00.31am.png"                    graphic-design/web-design-sample-3.png
get "$G/yogabra_comfyyogastyle_300x600_v2.jpg"                graphic-design/yoga-bra-display-ad.jpg

# Favicon (Yola default location; replace with your own if this fails)
get "https://www.boulderdigitalmedia.com/favicon.ico"         favicon.ico

[ $fail -eq 0 ] && echo "All images downloaded." || echo "Some images failed — save those manually into images/."
