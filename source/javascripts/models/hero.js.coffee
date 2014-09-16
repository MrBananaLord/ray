class RaY.Models.Hero extends RaY.Engine.Entity
  collidable: true
  gravitable: true
  sourceWidth: 99
  sourceHeight: 63
  width: 33
  height: 21
  speed: 3
  jumpingCounter: 0
  jumpingForce: 12
  jumping: false
  falling: true
  frames: 2
  frameDelay: 6
  moving: false

  constructor: (@world, imagePath) ->
    super(@world, imagePath)
        
  update: ->
    @animationName = "stay" unless @moving
    @moving = false
    @jump() if @jumping
    super
  
  moveLeft: ->
    @moving = true
    @animationName = "moveLeft"
    @x -= @speed
    @setPosition(@x, @y)
  
  moveRight: ->
    @moving = true
    @animationName = "moveRight"
    @x += @speed
    @setPosition(@x, @y)
  
  jump: ->
    @moving = true
    unless @falling
      @y -= @jumpingForce - @jumpingCounter
      @jumpingCounter += 1
      if @jumpingCounter >= @maximumSpeed
        @endJumping()
        @startFalling()
    
  startJumping: -> @jumping = true
  endJumping: ->
    @jumping = false
    @jumpingCounter = 0
    
  manageCollisionWith: (element) ->
    super unless element instanceof RaY.Models.Hero
    
  leftSideCollisionWith: (element) ->
    super
    element.applyForce(-@speed, 0)
  rightSideCollisionWith: (element) ->
    super
    element.applyForce(@speed, 0)
  bottomSideCollisionWith: (element) ->
    if @left() + @speed == element.right() or @left() - @speed == element.right()
      @setPosition(element.right(), @y)
    else if @right() + @speed == element.left() or @right() - @speed == element.left()
      @setPosition(element.left() - @width, @y)
    else
      super
      @endJumping()
  topSideCollisionWith: (element) ->
    super
    @endJumping()
    @startFalling()
  
  animationOffset: ->
    switch @animationName
      when "stay" then 0
      when "moveRight" then 1
      when "moveLeft" then 2
      else 0
  
