Crafty.c "Tile",
  init: ->
    @requires("DOM, 2D, Grid")
    @at = @_at

  _at: (x, y, level = 0) ->
    level = level * 40
    board = game.board()
    if x? and y?
      @attr
        x: x * board.tile_width()
        y: y * board.tile_height() - level
      @
    else
      x: @x / board.grid_width()
      y: @y / board.tile_height() - level
