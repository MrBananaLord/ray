class RaY.Models.Level extends RaY.Engine.Module
  @include RaY.Engine.Modules.Callbacks
  offsetX: 0
  offsetY: 0
  height: 480
  width: 640
  elements: []
  
  constructor: (@world) ->
    @buildScene()
    
  createBackground: ->
    background = new RaY.Engine.Rectangle(@world)
    background.fillStyle = "#234"
    background.width = 640
    background.height = 480
    @elements.push(background)
    return background
  
  createYellowHero: ->
    hero = new RaY.Models.YellowHero(@world)
    hero.x = 75
    hero.y = 100
    @elements.push(hero)
    return hero
  
  createRedHero: ->
    hero = new RaY.Models.RedHero(@world)
    hero.x = 5
    hero.y = 455
    @elements.push(hero)
    return hero
    
  buildScene: ->
    @background = @createBackground()
    @yellowHero = @createYellowHero()
    @redHero = @createRedHero()
    
    # sides
    @elements.push new RaY.Models.Platform(@world, 0, 0, 5, 480, "#fff")
    @elements.push new RaY.Models.Platform(@world, 0, 0, 640, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 635, 0, 5, 480, "#fff")
    @elements.push new RaY.Models.Platform(@world, 0, 475, 640, 5, "#fff")
    
    # platforms
    @elements.push new RaY.Models.Platform(@world, 50, 435, 75, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 125, 375, 125, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 5, 300, 95, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 190, 380, 5, 95, "#fff")
    @elements.push new RaY.Models.Platform(@world, 100, 260, 75, 5, "#fff")
    @elements.push new RaY.Models.Platform(@world, 100, 265, 5, 15, "#fff")
    @elements.push new RaY.Models.Platform(@world, 170, 140, 5, 120, "#111")
    
    # boxes
    @elements.push new RaY.Models.Box(@world, 5, 180, "#e92")
    @elements.push new RaY.Models.Box(@world, 5, 220, "#e92")
    @elements.push new RaY.Models.Box(@world, 5, 100, "#e92")
    @elements.push new RaY.Models.Box(@world, 5, 80, "#e92")
