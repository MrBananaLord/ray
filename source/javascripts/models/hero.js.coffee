class RaY.Models.Hero extends RaY.Engine.Entity
  collidable: true
  gravitable: true
  sourceWidth: 99
  sourceHeight: 63
  width: 33
  height: 21
  speed: 3
  #frames: 4
  #frameDelay: 4

  constructor: (@world) ->
    super(@world, "images/game/hero_static.png")
    @bindToEvents()
    
  bindToEvents: =>
    @world.bind "keyDown", (name) =>
      switch name
        when "left" then @moveLeft()
        when "right" then @moveRight()
        when "down" then @moveDown()
        when "up" then @moveUp()
    super
        
  moveLeft: =>
    @x -= @speed
    @setPosition(@x, @y)
  
  moveRight: =>
    @x += @speed
    @setPosition(@x, @y)
    
  moveUp: =>
    @y -= @speed + 1
    @setPosition(@x, @y)
  
  moveDown: =>
    @y += @speed
    @setPosition(@x, @y)
    
  stop: =>
    @y -= @world.gravity
    @setPosition(@x, @y)
    
  leftSideCollisionWith: (element) ->
    super
    element.applyForce(-@speed, 0)
  rightSideCollisionWith: (element) ->
    super
    element.applyForce(@speed, 0)
  
  
