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
    left.height = 50
    left.width = 30
    left.y = 1
    left.x = 180
    left.gravitable = true
    @left = left
    @elements.push(left)
    
    right = new RaY.Engine.Rectangle(this)
    right.collidable = true
    right.height = 10
    right.width = 30
    right.y = 105
    right.x = 180
    right.gravitable = true
    @right = right
    @elements.push(right)
    
    top = new RaY.Engine.Rectangle(this)
    top.collidable = true
    top.height = 100
    top.width = 30
    top.y = 50
    top.x = 20
    top.gravitable = true
    @top = top
    @elements.push(top)
    
    bottom = new RaY.Engine.Rectangle(this)
    bottom.collidable = true
    bottom.fillStyle = "#f98"
    bottom.height = 10
    bottom.width = 320
    bottom.y = 220
    bottom.x = 100
    @bottom = bottom
    @elements.push(bottom)
    
    bottom = new RaY.Engine.Rectangle(this)
    bottom.collidable = true
    bottom.fillStyle = "#f98"
    bottom.height = 10
    bottom.width = 320
    bottom.y = 320
    bottom.x = 10
    @bottom2 = bottom
    @elements.push(bottom)
    
    bottom = new RaY.Engine.Rectangle(this)
    bottom.collidable = true
    bottom.fillStyle = "#f98"
    bottom.height = 10
    bottom.width = 320
    bottom.y = 270
    bottom.x = 60
    @bottom3 = bottom
    @elements.push(bottom)
    
