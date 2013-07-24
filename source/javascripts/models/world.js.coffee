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
    
    @rec = new RaY.Engine.Rectangle(this, "#000")
    @rec.collidable = true
    @rec.height = 100
    @rec.width = 400
    @rec.x = 10
    @rec.y = 400
    
    @rec1 = new RaY.Engine.Rectangle(this, "#000")
    @rec1.collidable = true
    @rec1.height = 400
    @rec1.width = 100
    @rec1.x = 400
    @rec1.y = 100
    
    @elements.push(@rec)
    @elements.push(@rec1)
        
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
    
  collidableElements: -> element for element in @elements when element.collidable
    
  checkCollisions: (object, modifier) =>
    for element in @collidableElements()
      if element.collidable && element != object && object.collidesWith(element)
        this.trigger("collision", object, element, modifier)
    
