class RaY.Models.RedHero extends RaY.Models.Hero
  constructor: (@world) ->
    super(@world, "images/game/red_hero.png")
      
  bindToEvents: ->
    @bind @world, "keyDown", (name) =>
      switch name
        when "left" then @moveLeft()
        when "right" then @moveRight()
        when "up" then @startJumping()
    super
