RaY.Engine.Modules.Callbacks =
  events: {}
 
  bind: (context, topic, handler) ->
    (@events[topic] ||=[]).push { handler, context, id: this.id() }
    
 
  trigger: (topic, args...) ->
    if @events[topic]?
      event.handler.apply event.context, args for event in @events[topic]
  
  purge: ->
    for topic in _.keys(@events)
      @events[topic] = @events[topic].filter (event) =>
        event.id != this.id()
    null
    
  destroy: ->
    @purge()
