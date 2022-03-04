# Returns a string containing # on dark spots and ' ' on light spots in a grid
def create_QR(link)
    qr = RQRCodeCore::QRCode.new(link)
    qr.to_s(dark: '#', light: ' ')
end
