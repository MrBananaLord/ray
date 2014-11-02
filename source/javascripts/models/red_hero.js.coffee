class RaY.Models.RedHero extends RaY.Models.Hero
  constructor: (@world) ->
    super(@world, "red_hero")
      
  bindToEvents: ->
    @bind @world, "keyDown", (name) =>
      switch name
        when "left" then @moveLeft()
        when "right" then @moveRight()
        when "up" then @startJumping()
    super
