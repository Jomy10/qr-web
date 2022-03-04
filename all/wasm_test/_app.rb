

class HelloWorld < Prism::Component
  attr_accessor :name

  def initialize(name = "World")
    @name = name
    # puts create_QR('https://google.com')
  end

  def render
    div(".hello-world", [
      input(onInput: call(:name=).with_target_data(:value)),
      div("Hello, #{name}", {attrs: {class: "Hello"}}),
      a("test", {attrs: {class: "e"}}),
      img({attrs: {src: "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"}})
    ])
  end
end

Prism.mount(HelloWorld.new)
