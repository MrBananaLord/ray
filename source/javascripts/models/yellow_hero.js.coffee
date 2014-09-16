class RaY.Models.YellowHero extends RaY.Models.Hero
  constructor: (@world) ->
    super(@world, "images/game/test.png")
      
  bindToEvents: ->
    @bind @world, "keyDown", (name) =>
      switch name
        when "a" then @moveLeft()
        when "d" then @moveRight()
        when "w" then @startJumping()
    super
