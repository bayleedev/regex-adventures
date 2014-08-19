Crafty.c "TileZSwitcher",

  # Cached @at()
  _at: null

  init: ->
    @_at = @at()
    @bind "Moved", @moved

  moved: ->
    return if @_at.y is @at().y
    at = @_at = @at()
    z = @z
    Crafty("Tile").each ->
      if @at().level is at.level
        if @at().y > at.y
          @attr(z: z + 1)
        else
          @attr(z: z - 1)
