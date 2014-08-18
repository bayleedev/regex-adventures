Crafty.c "Tile",

  level: 0

  init: ->
    @requires("DOM, 2D")

  at: (x, y, level = @level) ->
    board = game.board()
    if x? and y?
      @attr
        x: x * board.tile_width()
        y: (y * board.tile_height()) - (level * board.level_height())
        level: level
      @
    else
      x: @x / board.tile_width()
      y: (@y + level * board.level_height()) / board.tile_height()
      level: level

  # PartialSolid determines I have this method
  solid_at: ->
    x: @x
    y: @y + 93
    w: 101
    h: 80
