class RaY.Models.Hero extends RaY.Engine.Entity
  collidable: true
  gravitable: true
  sourceWidth: 99
  sourceHeight: 63
  width: 33
  height: 21
  speed: 2
  #frames: 4
  #frameDelay: 4
  jumpingCounter: 0
  jumping: false

  constructor: (@world) ->
    super(@world, "images/game/hero_static.png")
    
  bindToEvents: ->
    @world.bind "keyDown", (name) =>
      switch name
        when "left" then @moveLeft()
        when "right" then @moveRight()
        when "up" then @startJumping()
    super
      
  update: ->
    @jump() if @jumping
    super
  
  moveLeft: ->
    @x -= @speed
    @setPosition(@x, @y)
  
  moveRight: ->
    @x += @speed
    @setPosition(@x, @y)
    
  jump: ->
    @y -= 10 - @jumpingCounter
    @jumpingCounter += 1
    
  startJumping: -> @jumping = true
  endJumping: ->
    @jumping = false
    @jumpingCounter = 0
    
  leftSideCollisionWith: (element) ->
    super
    element.applyForce(-@speed, 0)
  rightSideCollisionWith: (element) ->
    super
    element.applyForce(@speed, 0)
  manageCollisionWith: (element) ->
    super
    @endJumping()
  
  
