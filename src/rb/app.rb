class HelloWorld < Prism::Component
  attr_accessor :url, :qr_code, :status

  def initialize()
    @url = ""
    @status = ""
  end

  def qr
    puts "Generating QR code"
    @status = "Generating"
    @qr_code = create_QR(@url)
    @status = "Generated!"
    # puts "Generated:\n#{@qr_code}"
  end

  def render
    div(".app", [
      main([
        h1("QR Code Generator"),
        label(".input", [
          # p(".input-prompt", "Enter url:"),
          input(".input_field", onInput: call(:url=).with_target_data(:value)),
          span('.input_label', "Enter url")
        ]),
        # div("Hello, #{url} :)", {attrs: {class: "Hello"}}),
        div(".button-view", [
          button('.generate', {:onclick => call(:qr)}, [text("Generate QR code")]),
          button("Download", {attrs: {id: "download", style: "opacity: 0%;"}}),
        ]),
        p(".status", "#{status}"),
        p("#{qr_code}", {attrs: {id: "qr-code"}}),
        canvas({attrs: {id: "qr-code-canvas", width: "500", height: "500"}})
        # img({attrs: {src: "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"}})
      ], {attrs: {class: 'card', id: "main-content"}})
    ])
  end
end

Prism.mount(HelloWorld.new)
