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
        div(".button-view", [
          button('.generate', {:onclick => call(:qr)}, [text("Generate QR code")]),
          button("Download", {attrs: {id: "download", style: "opacity: 0%;", disabled: "true"}}),
        ]),
        div(".dl-control-view", [
          p("Dimensions:"),
          input('.input_field .dl-control', {
            attrs: {
              id: 'width-field',
              style: 'opacity: 0%;'
            }}
          ),
          span('.input_label .dl-control', "width", {
            attrs: {
              id: "input-label-1",
              style: 'opacity: 0%;'
            }}
          ),
          input('.input_field .dl-control', {
            attrs: {
              id: 'height-field',
              style: 'opacity: 0%;'
            }}
          ),
          span('.input_label .dl-control', "height", {
            attrs: {
              id: "input-label-2",
              style: 'opacity: 0%;'
            }}
          ),
        ]),
        # p(".status", "#{status}"),
        p("#{qr_code}", {attrs: {id: "qr-code"}}),
        canvas({
          attrs: {
            id: "qr-code-canvas", 
            width: "500", 
            height: "500"}
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
