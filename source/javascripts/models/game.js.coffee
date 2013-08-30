class RaY.Models.Game
    
  run: ->
    @setup()
    @animate()
  
  setup: ->
    @world = new RaY.Models.World
    @inputHandler = new RaY.Engine.InputHandler(@world)
  
  animate: =>
    requestAnimationFrame(@animate)
    @main()
    
  main: =>
    @update()
    @render()
    
  render: -> @world.render()
  
  update: ->
    @inputHandler.update()
    @world.update()
