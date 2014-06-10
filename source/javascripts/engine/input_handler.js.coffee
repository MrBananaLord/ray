class RaY.Engine.InputHandler
  keys:
    37: "left"
    38: "up"
    39: "right"
    87: "w"
    68: "d"
    65: "a"
    82: "r"
  keysDown: {}

  constructor: (@world) ->
    $("body").keydown (e) => @keyDown(e.keyCode)
    $("body").keyup (e)   => @keyUp(e.keyCode)

  update: ->
    for key in _.intersection(_.keys(@keysDown), _.keys(@keys))
      @world.trigger("keyDown", @keys[key])
    
  keyDown: (code) ->
    @keysDown[code] = true
  
  keyUp: (code) ->
    @world.trigger("keyUp", @keys[code])
    delete @keysDown[code]
