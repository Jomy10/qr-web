# Returns a string containing # on dark spots and ' ' on light spots in a grid
def create_QR(link)
    qr = RQRCodeCore::QRCode.new(link)
    qr_gen = qr.to_s(dark: '#', light: '%')
    qr_gen.gsub!("\n", "&")
    puts("qr code: #{qr_gen}")
    qr_gen
end
