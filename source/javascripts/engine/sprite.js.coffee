class RaY.Engine.Sprite extends RaY.Engine.Rectangle
  sourceX: 0
  sourceY: 0
  sourceWidth: 0
  sourceHeight: 0
  frame: 0
  frames: 1
  frameDelay: 1
  frameDelayCounter: 0

  constructor: (@world, imageUrl) ->
    @image = new RaY.Engine.SpriteImage(imageUrl)
    super

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
    @animate()
    super
    
  animate: ->
    if @frameDelay <= @frameDelayCounter
      @frame = (@frame + 1) % @frames
      @frameDelayCounter = 0
    else
      @frameDelayCounter += 1
      
