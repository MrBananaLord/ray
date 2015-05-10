class RaY.Models.Rainbow extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  
  constructor: (@world) ->
    @particles = _(6).times (rowIndex) =>
      fillStyle = ["#f00", "#f80", "#ff0", "#0f0", "#00f", "#80f"][rowIndex]
      
      _(10).times (particleIndex) =>
        new RaY.Engine.Rectangle(@world, {
          x: 10
          y: 10
          width: 4 - particleIndex / 3
          height: 4 - particleIndex / 3
          fillStyle: fillStyle
        })
    
  destroy: ->
    for row in @particles
      particle.destroy() for particle in row
    @particles = []
    @purge()
    
  setPosition: (x, y) ->
    [originalX, originalY] = [x, y]
    for row, rowIndex in @particles
      [x, y] = [originalX, originalY + rowIndex * 3]
      for particle, particleIndex in row
        [tmpX, tmpY] = [particle.x, particle.y - particleIndex / 8]
        particle.setPosition(x, y + particleIndex / 8)
        [x, y] = [tmpX, tmpY]
      
