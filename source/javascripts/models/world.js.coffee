class RaY.Models.World
  viewWidth: 640
  viewHeight: 480
  width: 1000
  height: 1000
  elements: []
  
  constructor: ->
    @context = @createCanvas()
    @elements.push new RaY.Models.Background(this)
    #    @hero = new RaY.Models.Hero(@context)
    #    @hero.setPosition(~~((@width - @hero.width)/2), ~~((@height - @hero.height)/2))
    #    @hero.jump()
    
    #@platforms = @generatePlatforms()
    #@gameLoop()
    
  createCanvas: ->
    canvas = document.createElement("canvas")
    canvas.width = @viewWidth
    canvas.height = @viewHeight
    $("body").append(canvas)
    canvas.getContext("2d")
    
  update: -> element.update() for element in @elements
    
  render: -> element.render() for element in @elements
