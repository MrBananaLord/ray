class RaY.Engine.InputHandler
  keysDown: {}

  constructor: (@world) ->
    $("body").keydown (e) => @keysDown[e.keyCode] = true
    $("body").keyup (e)   => delete @keysDown[e.keyCode]

  update: (modifier) ->
    @world.handle_input("keydown", "left", modifier)    if 37 of @keysDown
    @world.handle_input("keydown", "right", modifier)   if 39 of @keysDown
    @world.handle_input("keydown", "up", modifier)      if 38 of @keysDown
    @world.handle_input("keydown", "down", modifier)    if 40 of @keysDown
