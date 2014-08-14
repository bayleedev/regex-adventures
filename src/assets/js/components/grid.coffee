Crafty.c "Grid",
  init: ->
    board = game.board()
    @attr
      w: board.grid_width()
      h: board.grid_height()

  at: (x, y) ->
    board = game.board()
    if x? and y?
      @attr
        x: x * board.grid_width()
        y: y * board.grid_height()
      @
    else
      x: @x / board.grid_width()
      y: @y / board.grid_height()
