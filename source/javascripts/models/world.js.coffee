class RaY.Models.World extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  viewWidth: 640
  viewHeight: 480
  width: 640
  height: 480
  gravity: 5
  elements: []
  
  constructor: ->
    @context = @createCanvasAndGetContext()
    @background = @createBackground()
    @hero = @createHero()
    @setupLevel()
        
  createCanvasAndGetContext: ->
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
  
  createBackground: ->
    background = new RaY.Engine.Rectangle(this)
    background.fillStyle = "#234"
    background.width = 640
    background.height = 480
    @elements.push(background)
    return background
    
  createHero: ->
    hero = new RaY.Models.Hero(this)
    @elements.push(hero)
    return hero
  
  setupLevel: ->
    rec = new RaY.Engine.Rectangle(this, "#000")
    rec.collidable = true
    rec.height = 100
    rec.width = 100
    rec.x = 200
    rec.y = 200
    @elements.push(rec)
