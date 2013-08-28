class RaY.Models.Hero extends RaY.Engine.Entity
  collidable: true
  gravitable: false
  sourceWidth: 99
  sourceHeight: 63
  width: 33
  height: 21
  speed: 3
  #frames: 4
  #animationInterval: 4

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
    @world.bind "collision", (object, element) =>
      if object == this
        @manageCollisionWith(element)
    super
        
  moveLeft: =>
    @x -= @velocity()
    @setPosition(@x, @y)
  
  moveRight: =>
    @x += @velocity()
    @setPosition(@x, @y)
    
  moveUp: =>
    @y -= @velocity()
    @setPosition(@x, @y)
  
  moveDown: =>
    @y += @velocity()
    @setPosition(@x, @y)
    
  manageCollisionWith: (element) ->
    if @left() <= element.right() and
       @x < @previousX and
       element.right() <= @previousX
      @setPosition(element.right() + 1, @y)
    if @right() >= element.left() and
       @x > @previousX and
       element.left() - @width >= @previousX
      @setPosition(element.left() - @width - 1, @y)
    if @top() <= element.bottom() and
       @y < @previousY and
       element.bottom() <= @previousY
      @setPosition(@x, element.bottom() + 1)
    if @bottom() >= element.top() and
       @y > @previousY and
       element.top() - @height >= @previousY
      @setPosition(@x, element.top() - @height - 1)
    
  stop: =>
    @y -= @world.gravity * @world.modifier
    @setPosition(@x, @y)
  
  
