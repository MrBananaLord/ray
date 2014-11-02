class RaY.Models.YellowHero extends RaY.Models.Hero
  constructor: (@world) ->
    super(@world, "yellow_hero")
      
  bindToEvents: ->
    @bind @world, "keyDown", (name) =>
      switch name
        when "a" then @moveLeft()
        when "d" then @moveRight()
        when "w" then @startJumping()
    super
