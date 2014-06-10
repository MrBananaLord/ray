class RaY.Engine.Module
  keywords = ['extended', 'included']
  __id = 0
  
  constructor: ->
  
  @extend: (obj) ->
    for key, value of obj when key not in keywords
      @[key] = value

    obj.extended?.apply(@)
    this

  @include: (obj) ->
    for key, value of obj when key not in keywords
      @::[key] = value

    obj.included?.apply(@)
    this
    
  id: ->
    return @_id if @_id
    __id += 1
    @_id = __id
