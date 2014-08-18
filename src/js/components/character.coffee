Crafty.c "Character",

  init: ->
    @requires("DOM, 2D, Fourway, PartialSolid, Fake2DCollision")
    @fourway 6
    @on_hit 'Tile', @stop_movement, @start_movement

  at: (x, y, level = @level) ->
    board = game.board()
    if x? and y?
      @attr
        x: x * board.tile_width()
        y: (y * board.tile_height()) - (level * board.level_height())
        level: level
      @
    else
      x: Math.round(@x / board.tile_width())
      y: Math.round((@y + level * board.level_height()) / board.tile_height())
      level: level

  # PartialSolid determines I have this method
  solid_at: ->
    x: @x + 19
    y: @y + 121
    w: 65
    h: 19
