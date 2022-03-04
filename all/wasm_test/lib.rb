def hello()
    puts 'hello world'
end

def create_QR(link)
    qr = RQRCodeCore::QRCode.new(link)
    qr.to_s
end