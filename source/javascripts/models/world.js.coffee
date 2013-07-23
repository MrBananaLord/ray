class RaY.Models.World extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  viewWidth: 640
  viewHeight: 480
  width: 1000
  height: 1000
  gravity: 5
  elements: []
  
  constructor: ->
    @context = @createCanvas()
    @background = new RaY.Models.Background(this)
    @elements.push(@background)
    @hero = new RaY.Models.Hero(this)
    @elements.push(@hero)
        
  createCanvas: ->
    canvas = document.createElement("canvas")
    canvas.width = @viewWidth
    canvas.height = @viewHeight
    $("body").append(canvas)
    canvas.getContext("2d")
    
  update: (modifier) ->
    element.update(modifier) for element in @elements
    
  render: ->
    element.render() for element in @elements
