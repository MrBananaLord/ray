class RaY.Engine.InputHandler
  keysDown: {}

  constructor: (@world) ->
    $("body").keydown (e) => @keysDown[e.keyCode] = true
    $("body").keyup (e)   => delete @keysDown[e.keyCode]

  update: (modifier) ->
    @world.trigger("keyDown", "left", modifier)       if 37 of @keysDown
    @world.trigger("keyDown", "up", modifier)         if 38 of @keysDown
    @world.trigger("keyDown", "right", modifier)      if 39 of @keysDown
    @world.trigger("keyDown", "down", modifier)       if 40 of @keysDown
