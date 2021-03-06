#!/usr/bin/env zsh

# Build `app.rb`
rm build/app.rb

# app.rb should always be the last file
files=('src/rb/rqrcode_core.rb' 'src/rb/lib.rb' 'src/rb/app.rb')
for f in $files; do
    (cat "${f}"; echo) >> build/app.rb;
done

# Copy asset files
rm -r build/qr-assets
cp -r src/assets build/qr-assets

sass "src/scss/card+input.scss" "build/qr-assets/css/card+input.css"
sass "src/scss/dl-controls.scss" "build/qr-assets/css/dl-controls.css"

cp src/index.html build/index.html
