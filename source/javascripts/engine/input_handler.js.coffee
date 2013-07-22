class RaY.Engine.InputHandler
  keysDown: {}

  constructor: (@world) ->
    $("body").keydown (e) => @keysDown[e.keyCode] = true
    $("body").keyup (e)   => delete @keysDown[e.keyCode]

  update: (modifier) ->
    @world.keyDown("keydown", "left", modifier)    if 37 of @keysDown
    @world.keyDown("keydown", "right", modifier)   if 39 of @keysDown
    @world.keyDown("keydown", "up", modifier)      if 38 of @keysDown
    @world.keyDown("keydown", "down", modifier)    if 40 of @keysDown
