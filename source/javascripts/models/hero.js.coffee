class RaY.Models.Hero extends RaY.Engine.Entity
  @include RaY.Engine.Modules.Callbacks
  
  sourceWidth: 65
  sourceHeight: 95
  destinationWidth: 65
  destinationHeight: 95
  collidable: true
  gravitable: true

  constructor: (@world) ->
    super(@world, "images/game/hero.png")
    @bindToEvents()
    @render(0,0,0,0)
    
  bindToEvents: =>
    self = this
    @world.bind "keyDown", (name, modifier) ->
      switch name
        when "left" then self.moveLeft(modifier)
        when "right" then self.moveRight(modifier)
        when "down" then self.moveDown(modifier)
        when "up" then self.moveUp(modifier)
#    @frames = 1
#    @interval = 4
#    @currentFrame = 0
#    @jumping = false
#    @falling = false
#    @jumpSpeed = 0
#    @fallSpeed = 0
        
  moveLeft: (modifier) =>
    @setPosition(@x - 5, @y)
  
  moveRight: (modifier) =>
    @setPosition(@x + 5, @y)
    
  moveUp: (modifier) =>
    @setPosition(@x, @y - 5)
  
  moveDown: (modifier) =>
    @setPosition(@x, @y + 5)
    
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

