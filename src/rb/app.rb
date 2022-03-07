class HelloWorld < Prism::Component
  attr_accessor :url, :qr_code

  def initialize()
    @url = ""
  end

  def qr
    puts "Generating QR code"
    @qr_code = create_QR(@url)
  end

  # generate button, download button and dimensions input field
  def controls
    div('.controls', [
      div(".button-view", [
        div([
          button('.generate', {:onclick => call(:qr)}, [text("Generate QR code")]),
        ], {
        attrs: {
          id: 'generate-parent'
        }}),
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
    ])
  end

  # One rectangle from the loading indicator
  def loadingRect(x, _begin)
    rect({attrs: {
      x: x,
      y: '0',
      width: '4',
      height: '10',
      fill: '#333'
    }}, [
      animateTransform({attrs: {
        class: 'load-rect',
        attributeType: 'xml',
        attributeName: 'transform',
        type: 'translate',
        values: '0 0; 0 20; 0 0',
        begin: _begin,
        dur: '0.8s',
        repeatCount: 'indefinite'
      }})
    ])
  end

  def loadingIndicator
    div('.loader', [
      svg({attrs: {
        id: 'loading-icon',
        version: '1.1',
        xmlns: 'http://www.w3.org/2000/svg',
        x: '0px',
        y: '0px',
        width: '24px',
        height: '30px',
        viewBox: '0 0 24 30',
        style: 'enable-background: new 0 0 50 50; opacity: 100%;'
      }}, [
        loadingRect('0', '0s'),
        loadingRect('10', '0.2s'),
        loadingRect('20', '0.4s')
      ])
    ], {attrs: {
      style: 'opacity: 0%;',
      id: 'loader'
    }})
  end

  def loadingIndicatorCss
    div('.load', Array.new(3, div('.line')))
  end

  def render
    div(".app", [
      main([
        h1("QR Code Generator"),
        label(".input", [
          input(".input_field", onInput: call(:url=).with_target_data(:value)),
          span('.input_label', "Enter url")
        ]),
        controls(),
        p("#{qr_code}", {attrs: {id: "qr-code"}}),
        loadingIndicator(),
        canvas({
          attrs: {
            id: "qr-code-canvas", 
            width: "500", 
            height: "500",
            style: "opacity: 0%;  display:none;"
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
