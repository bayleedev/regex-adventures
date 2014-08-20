Crafty.c "TileZSwitcher",

  # Cached @at()
  _at: null

  init: ->
    @_at = @at()
    @bind "Moved", @moved

  moved: ->
    return if @_at.y is @at().y
    @_at = @at()
    for item in Crafty.find("Tile", {at: {level: @at().level}})
      if item.at().y > @at().y
        item.attr(z: @z + 1)
      else
        item.attr(z: @z - 1)
