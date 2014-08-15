Crafty.c "Tile",

  level_height: 40

  init: ->
    @requires("DOM, 2D")

  at: (x, y, level = 0) ->
    board = game.board()
    if x? and y?
      @attr
        x: x * board.tile_width()
        y: y * board.tile_height() - level * board.tile_level()
      @
    else
      x: @x / board.tile_width()
      y: @y / board.tile_height() - level * board.tile_level()
