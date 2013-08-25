class RaY.Models.Hero extends RaY.Engine.Entity
  collidable: true
  gravitable: false
  sourceWidth: 200
  sourceHeight: 188
  width: 100
  height: 99
  speed: 5
  frames: 4
  animationInterval: 4

  constructor: (@world) ->
    super(@world, "images/game/hero.png")
    @bindToEvents()
    
  bindToEvents: =>
    @world.bind "keyDown", (name) =>
      switch name
        when "left" then @moveLeft()
        when "right" then @moveRight()
        when "down" then @moveDown()
        when "up" then @moveUp()
    @world.bind "collision", (object, element, side) =>
      if object == this
        @stick(element, side)
        
  moveLeft: =>
    @x -= @velocity()
    @setPosition(@x, @y)
  
  moveRight: =>
    @x += @velocity()
    @setPosition(@x, @y)
    
  moveUp: =>
    @y -= @velocity() * 2
    @setPosition(@x, @y)
  
  moveDown: =>
    @y += @velocity()
    @setPosition(@x, @y)
    
  stick: (element, side) =>
    console.debug side
    @setPosition(@x, element.y - @height - 1) if side == "bottom"
    @setPosition(@x, element.y + element.height + 1) if side == "top"
    @setPosition(element.x - @width - 1, @y) if side == "right"
    @setPosition(element.x + element.width + 1, @y) if side == "left"
    
  stop: =>
    @y -= @world.gravity * @world.modifier
    @setPosition(@x, @y)
  
  
