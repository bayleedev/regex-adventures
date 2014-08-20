Crafty.find = (components, attributes) ->
    items = []
    Crafty(components).each ->
      for key,value of attributes
        if key is 'at'
          return if value.x? and value.x isnt @at().x
          return if value.y? and value.y isnt @at().y
          return if value.z? and value.z isnt @at().z
          return if value.level? and value.level isnt @at().level
        else
          return if @[key] isnt value
      items.push @
    items
