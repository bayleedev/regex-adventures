Crafty.c "Character",

  init: ->
    @requires("DOM, 2D, Fourway, PartialSolid, Fake2DCollision")
    @fourway 6
    @prevent_collision()

  at: (x, y, z = @z) ->
    board = game.board()
    if x? and y?
      @attr
        x: x * board.tile_width()
        y: (y * board.tile_height()) - (z * board.z_height())
        z: z
      @
    else
      x: Math.round(@x / board.tile_width())
      y: Math.round((@y + z * board.z_height()) / board.tile_height())
      z: z

  # PartialSolid determines I have this method
  solid_at: ->
    x: @x + 7
    y: @y + 121
    w: 77
    h: 19
