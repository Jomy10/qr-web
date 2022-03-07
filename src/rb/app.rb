class HelloWorld < Prism::Component
  attr_accessor :url, :qr_code

  def initialize()
    @url = ""
  end

  def qr
    puts "Generating QR code" 
    @qr_code = create_QR(@url)
  end

  def render
    div(".app", [
      main([
        h1("QR Code Generator"),
        label(".input", [
          input(".input_field", onInput: call(:url=).with_target_data(:value)),
          span('.input_label', "Enter url")
        ]),
        div('.controls', [
          div(".button-view", [
            button('.generate', {:onclick => call(:qr)}, [text("Generate QR code")]),
            button("Download", {attrs: {id: "download", style: "opacity: 0%;", disabled: "true"}}),
          ]),
          div(".dl-control-view", [
            input('.input_field .dl-control', {
              attrs: {
                id: 'dimension-field',
                style: 'opacity: 0%;',
                disabled: 'true'
              }}
            ),
            span('.input_label .dl-control', "Dimensions", {
              attrs: {
                id: "input-label",
                style: 'opacity: 0%;'
              }}
            ),
          ]),
        ]),
        p("#{qr_code}", {attrs: {id: "qr-code"}}),
        canvas({
          attrs: {
            id: "qr-code-canvas", 
            width: "500", 
            height: "500",
            style: "opacity: 0%;display:none;"
          }
        }),
        # Will hold the image of the canvas
        img({
          attrs: {
            id: 'qr-code-img',
            width: '100%',
            height: '100%',
            # TODO: #4 center image
            style: "max-width: 650px; margin-left: auto; margin-right: auto;"
          }
        })
      ], 
      {
        attrs: {
          class: 'card', 
            id: "main-content"
          }
        }
      )
    ])
  end
end

Prism.mount(HelloWorld.new)
