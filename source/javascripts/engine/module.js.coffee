class RaY.Engine.Module
  keywords = ['extended', 'included']
  
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
