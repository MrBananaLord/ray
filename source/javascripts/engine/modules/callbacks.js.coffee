RaY.Engine.Modules.Callbacks =
  events: {}
 
  bind: (topic, handler, context = this) ->
    (@events[topic] ||= []).push { handler, context }
 
  trigger: (topic, args...) ->
    if @events[topic]?
      event.handler.apply event.context, args for event in @events[topic]
