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
    @world.bind "keyDown", (name) =>
      switch name
        when "left" then @moveLeft()
        when "right" then @moveRight()
        when "down" then @moveDown()
        when "up" then @moveUp()
    @world.bind "collision", (object, element) =>
      if object == this
        @stop()
        
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
    
  stop: =>
    @y -= @world.gravity * @world.modifier
    @setPosition(@x, @y)
  
  
