class RaY.Models.World extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  viewWidth: 640
  viewHeight: 480
  width: 640
  height: 480
  gravity: 3
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
    this.trigger("storePreviousData")
    
  render: ->
    element.render() for element in @elements
    
  collidableElements: -> element for element in @elements when element.collidable
    
  checkCollisions: (object) =>
    for element in @collidableElements()
      object.checkAndTriggerCollisionWith(element) if element.collidable && element != object
        
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
    hero.x = 100
    hero.y = 100
    @elements.push(hero)
    return hero
  
  setupLevel: ->
    left = new RaY.Engine.Rectangle(this)
    left.collidable = true
    left.height = 10
    left.width = 10
    left.y = 105
    left.x = 140
    left.gravitable = true
    @left = left
    @elements.push(left)
    
    bottom = new RaY.Engine.Rectangle(this)
    bottom.collidable = true
    bottom.fillStyle = "#f98"
    bottom.height = 10
    bottom.width = 620
    bottom.y = 220
    bottom.x = 10
    @bottom = bottom
    @elements.push(bottom)
