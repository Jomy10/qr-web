require 'rqrcode'

qr = RQRCode::QRCode.new('https://google.com')

puts qr.to_s(dark: "▓", light: "  ")