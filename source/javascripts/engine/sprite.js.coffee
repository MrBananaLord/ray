class RaY.Engine.Sprite extends RaY.Engine.Rectangle
  sourceWidth: 0
  sourceHeight: 0
  activeAnimationName: "default"
  
  constructor: (@world, imageName) ->
    @image = @world.images(imageName)
    @activateAnimation(@activeAnimationName, true)
    super

  drawImage: (sourceX, sourceY, destinationX, destinationY) ->
    if @image.isReady()
      @world.context.drawImage(
        @image.image,
        @activeAnimation()["sourceX"] + @sourceWidth * @frame,
        @activeAnimation()["sourceY"],
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
    if @activeAnimation()["delay"] <= @animationDelayCounter
      @frame = (@frame + 1) % @activeAnimation()["frames"]
      @animationDelayCounter = 0
    else
      @animationDelayCounter += 1
  
  activeAnimation: ->
    @animations()[@activeAnimationName]
    
  activateAnimation: (name, force = false) ->
    throw "InvalidAnimationName" unless @animations()[name]
    if force or name != @activeAnimationName
      @resetAnimationData()
      @activeAnimationName = name
    
  resetAnimationData: ->
    @frame = 0
    @animationDelayCounter = 0
  
  animations: ->
    default:
      frames: 1
      delay: 1
      sourceX: 0
      sourceY: 0
    
