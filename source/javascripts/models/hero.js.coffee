class RaY.Models.Hero extends RaY.Engine.Entity
  @include RaY.Engine.Modules.Callbacks
  
  collidable: true
  gravitable: true
  sourceWidth: 65
  sourceHeight: 95
  destinationWidth: 65
  destinationHeight: 95
  speed: 500

  constructor: (@world) ->
    super(@world, "images/game/hero.png")
    @bindToEvents()
    @render(0,0,0,0)
    
  bindToEvents: =>
    hero = this
    @world.bind "keyDown", (name, modifier, context = hero) ->
      switch name
        when "left" then context.moveLeft(modifier)
        when "right" then context.moveRight(modifier)
        when "down" then context.moveDown(modifier)
        when "up" then context.moveUp(modifier)
        
  moveLeft: (modifier) =>
    @x -= @velocity(modifier)
    @setPosition(@x, @y)
  
  moveRight: (modifier) =>
    @x += @velocity(modifier)
    @setPosition(@x, @y)
    
  moveUp: (modifier) =>
    @y -= @velocity(modifier)
    @setPosition(@x, @y)
  
  moveDown: (modifier) =>
    @y += @velocity(modifier)
    @setPosition(@x, @y)
    
#    
#  draw: =>
#    try
#      @context.drawImage(@image, 0, @height * @currentFrame, @width, @height, @x, @y, @width, @height)
#    catch e
#    
#    if @interval == 4
#      @nextFrame()
#      @interval = 0
#    @interval += 1
#  
#  nextFrame: =>
#    if @currentFrame == @frames
#      @currentFrame = 0
#    else
#      @currentFrame += 1

#  jump: =>
#    if !@jumping && !@falling
#      @fallSpeed = 0
#      @jumping = true
#      @jumpSpeed = 17
#  
#  checkJump: =>
#    @setPosition(@x, @y - @jumpSpeed)
#    @jumpSpeed -= 1
#    
#    if @jumpSpeed == 0
#      @jumping = false
#      @falling = true
#      @fallSpeed = 1
#  
#  checkFall: =>
#    if @y < @context.canvas.height - @height
#      @setPosition(@x, @y + @fallSpeed)
#      @fallSpeed += 1
#    else
#      @fallStop()
#      
#  fall: =>
#    @falling = true
#      
#  fallStop: =>
#    @falling = false
#    @fallSpeed = 0
#    

#  collides: (object) =>
#    @x < object.x + object.width &&
#    @x + @width > object.x && 
#    @y + @height > object.y && 
#    @y + @height < object.y + object.height

