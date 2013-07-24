class RaY.Engine.InputHandler
  keysDown: {}

  constructor: (@world) ->
    $("body").keydown (e) => @keysDown[e.keyCode] = true
    $("body").keyup (e)   => delete @keysDown[e.keyCode]

  update: ->
    @world.trigger("keyDown", "left")       if 37 of @keysDown
    @world.trigger("keyDown", "up")         if 38 of @keysDown
    @world.trigger("keyDown", "right")      if 39 of @keysDown
    @world.trigger("keyDown", "down")       if 40 of @keysDown
