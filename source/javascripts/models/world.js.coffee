class RaY.Models.World extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  viewWidth: 640
  viewHeight: 480
  width: 640
  height: 480
  gravity: 1
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
    #element.update() for element in @elements
    @trigger("update")
  render: ->
    #element.render() for element in @elements
    @trigger("render")
    
  collidableElements: -> element for element in @elements when element.collidable
    
  checkCollisionsFor: (object) =>
    for element in @collidableElements()
      if element.collidable && element != object
        object.checkAndTriggerCollisionWith(element)
  
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
    left.width = 30
    left.y = 105
    left.x = 220
    left.gravitable = true
    @left = left
    @elements.push(left)
    
    rigth = new RaY.Engine.Rectangle(this)
    rigth.collidable = true
    rigth.height = 10
    rigth.width = 30
    rigth.y = 105
    rigth.x = 140
    rigth.gravitable = true
    @rigth = rigth
    @elements.push(rigth)
    
    bottom = new RaY.Engine.Rectangle(this)
    bottom.collidable = true
    bottom.fillStyle = "#f98"
    bottom.height = 10
    bottom.width = 620
    bottom.y = 220
    bottom.x = 10
    @bottom = bottom
    @elements.push(bottom)
    
