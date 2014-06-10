RaY.Engine.Modules.Callbacks =
  events: {}
  topics: []
 
  bind: (context, topic, handler) ->
    unless @events[topic]?
      @events[topic] = []
      @topics.push(topic)
    @events[topic].push { handler, context, id: this.id() }
    
 
  trigger: (topic, args...) ->
    if @events[topic]?
      event.handler.apply event.context, args for event in @events[topic]
  
  unbind: ->
    for topic in @topics
      @events[topic] = @events[topic].filter (event) =>
        event.id != this.id()
    this
