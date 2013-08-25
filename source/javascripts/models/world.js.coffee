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
    @rec.width = 100
    @rec.x = 200
    @rec.y = 200
    
    #    @rec1 = new RaY.Engine.Rectangle(this, "#000")
    #    @rec1.collidable = true
    #    @rec1.height = 400
    #    @rec1.width = 100
    #    @rec1.x = 500
    #    @rec1.y = 100
    
    @elements.push(@rec)
    #    @elements.push(@rec1)
        
  createCanvas: ->
    canvas = document.createElement("canvas")
    canvas.width = @viewWidth
    canvas.height = @viewHeight
    $("body").append(canvas)
    canvas.getContext("2d")
    
  update: ->
    element.update() for element in @elements
    
  render: ->
    element.render() for element in @elements
    
  collidableElements: -> element for element in @elements when element.collidable
    
  checkCollisions: (object) =>
    for element in @collidableElements()
      object.checkCollisionWith(element) if element.collidable && element != object
        
  animationStep: -> Math.ceil(@modifier - 1)
