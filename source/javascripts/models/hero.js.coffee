class RaY.Models.Hero extends RaY.Engine.Entity
  collidable: true
  gravitable: true
  sourceWidth: 65
  sourceHeight: 95
  width: 65
  height: 95
  speed: 5

  constructor: (@world) ->
    super(@world, "images/game/hero.png")
    @bindToEvents()
    
  bindToEvents: =>
    self = this
    @world.bind "keyDown", (name, modifier, context = self) ->
      switch name
        when "left" then context.moveLeft(modifier)
        when "right" then context.moveRight(modifier)
        when "down" then context.moveDown(modifier)
        when "up" then context.moveUp(modifier)
    @world.bind "collision", (object, element, modifier, context = self) ->
      context.stop(modifier) if object == context
        
  moveLeft: (modifier) =>
    @x -= @velocity(modifier)
    @setPosition(@x, @y)
  
  moveRight: (modifier) =>
    @x += @velocity(modifier)
    @setPosition(@x, @y)
    
  moveUp: (modifier) =>
    @y -= @velocity(modifier * 3)
    @setPosition(@x, @y)
  
  moveDown: (modifier) =>
    @y += @velocity(modifier * 0)
    @setPosition(@x, @y)
    
  stop: (modifier) =>
    @y -= @world.gravity * modifier
    @setPosition(@x, @y)
