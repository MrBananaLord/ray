class RaY.Engine.Sprite extends RaY.Engine.Rectangle
  sourceX: 0
  sourceY: 0
  sourceWidth: 0
  sourceHeight: 0
  frame: 0
  frames: 1
  animationInterval: 1
  animationCounter: 0

  constructor: (@world, imageUrl) ->
    @image = new RaY.Engine.SpriteImage(imageUrl)

  drawImage: (sourceX, sourceY, destinationX, destinationY) ->
    if @image.ready
      @world.context.drawImage(
        @image.image,
        sourceX + @sourceWidth * @frame,
        sourceY,
        @sourceWidth,
        @sourceHeight,
        destinationX,
        destinationY,
        @width,
        @height)
  
  update: ->
    @manageAnimation()
    super
    
  setFrame: ->
    @frame = (@world.animationStep() + @frame) % @frames
    
  manageAnimation: ->
    if @animationInterval <= @animationCounter
      @setFrame()
      @animationCounter = 0
    else
      @animationCounter += @world.animationStep()
      
