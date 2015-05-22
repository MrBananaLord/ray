class RaY.Models.Rainbow extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks

  rainbowLength: 10
  currentColumn: 0

  constructor: (@world) ->
    @particles = _(6).times (rowIndex) =>
      fillStyle = ["#f00", "#f80", "#ff0", "#0f0", "#00f", "#80f"][rowIndex]

      _(@rainbowLength).times (particleIndex) =>
        new RaY.Engine.Rectangle(@world, {
          x: 10
          y: 10
          width: 4
          height: 4
          fillStyle: fillStyle
        })

  destroy: ->
    for row in @particles
      particle.destroy() for particle in row
    @particles = []
    @purge()

  setPosition: (x, y) ->
    @iterateColumn()
    for row, rowIndex in @particles
      row[@currentColumn].setPosition(x, y + rowIndex * 3)

  iterateColumn: -> @currentColumn = (@currentColumn + 1) % @rainbowLength
