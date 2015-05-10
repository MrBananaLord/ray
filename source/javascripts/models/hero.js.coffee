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
  moving: false
  activeAnimationName: "stayRight"

  constructor: (@world, imagePath) ->
    @rainbow = new RaY.Models.Rainbow(@world)
    super(@world, imagePath)
    @jumpSound = @world.sounds("jump")
        
  update: ->
    @animateStay() unless @moving
    @moving = false
    @jump() if @jumping
    @spawnRainbow()
    super
    
  moveLeft: ->
    @moving = true
    @activateAnimation("runLeft")
    @x -= @speed
    @setPosition(@x, @y)
  
  moveRight: ->
    @moving = true
    @activateAnimation("runRight")
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
    
  startJumping: ->
    @jumpSound.play() unless @jumping or @falling
    @jumping = true
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
    
  animateStay: ->
    @activateAnimation(
      if @activeAnimationName.indexOf("Left") != -1
        "stayLeft"
      else
        "stayRight"
    )

  spawnRainbow: ->  
    if @activeAnimationName.indexOf("Left") != -1
      @rainbow.setPosition(@x + 23, @y + 1)
    else
      @rainbow.setPosition(@x + 7, @y + 1)

  animations: ->
    stayRight:
      frames: 1
      delay: 1
      sourceX: 0
      sourceY: 0
    stayLeft:
      frames: 1
      delay: 1
      sourceX: @sourceWidth
      sourceY: 0
    runLeft:
      frames: 2
      delay: 6
      sourceX: 0
      sourceY: @sourceHeight * 2
    runRight:
      frames: 2
      delay: 6
      sourceX: 0
      sourceY: @sourceHeight
      
  destroy: ->
    @rainbow.destroy()
    super
