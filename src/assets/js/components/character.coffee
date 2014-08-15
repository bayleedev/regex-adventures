Crafty.c "Character",

  init: ->
    @requires("DOM, 2D, Fourway")

  at: (x, y, z = @z) ->
    board = game.board()
    if x? and y?
      @attr
        x: x * board.tile_width()
        y: (y * board.tile_height()) - (z * board.z_height())
        z: z
      @
    else
      x: @x / board.tile_width()
      y: (@y + z * board.z_height()) / board.tile_height()
      z: z
