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
    
  render: -> @world.trigger("render")
  
  update: ->
    @inputHandler.update()
    @world.trigger("update")
