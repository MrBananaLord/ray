class RaY.Models.Message extends RaY.Engine.Rectangle
  collidable: false
  gravitable: false
  fillStyle: "#fff"
  textFillStyle: "#000"
  font: "12pt Calibri"
  width: 640
  height: 480
  x: 10
  y: 10
  contentX: 0
  contentY: 0
  
  constructor: (@world, @content, options = {}) ->
    for option in ['x', 'y', 'width', 'height', 'fillStyle', 'font', 'fillText'
                   'contentX', 'contentY', 'textFillStyle']
      this[option] = options[option] || this[option]
    super(@world)
    
  render: ->
    super
    @world.context.font = @font
    @world.context.fillStyle = @textFillStyle
    @world.context.fillText(@content, @x + @contentX, @y + @contentY)
