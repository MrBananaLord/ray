class RaY.Models.Game  
    
  run: ->
    @setup()
    @animate()
  
  setup: ->
    @world = new RaY.Models.World
  
  animate: =>
    requestAnimationFrame(@animate)
    @main()
    
  main: =>
    @update()
    @render()
    
  render: -> @world.render()
  
  update: -> @world.update()
