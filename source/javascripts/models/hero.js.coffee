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
    @world.bind "keyDown", (name, modifier) =>
      switch name
        when "left" then @moveLeft(modifier)
        when "right" then @moveRight(modifier)
        when "down" then @moveDown(modifier)
        when "up" then @moveUp(modifier)
    @world.bind "collision", (object, element, modifier) =>
      @stop(modifier) if object == this
        
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
