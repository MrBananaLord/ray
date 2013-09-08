class RaY.Engine.InputHandler
  keysDown: {}

  constructor: (@world) ->
    $("body").keydown (e) => @keysDown[e.keyCode] = true
    $("body").keyup (e)   => delete @keysDown[e.keyCode]

  update: ->
    @world.trigger("keyDown", "left")       if 37 of @keysDown
    @world.trigger("keyDown", "up")         if 38 of @keysDown
    @world.trigger("keyDown", "right")      if 39 of @keysDown
    @world.trigger("keyDown", "w")          if 87 of @keysDown
    @world.trigger("keyDown", "d")          if 68 of @keysDown
    @world.trigger("keyDown", "a")          if 65 of @keysDown
    @world.trigger("keyDown", "r")          if 82 of @keysDown
