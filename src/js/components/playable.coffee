Crafty.c 'Player',

  init: ->
    @requires('Fourway, Fake2DCollision, TileZSwitcher, EmptyCollision')
    @fourway 6
    @on_empty_hit @stop_movement, @start_movement
    @on_hit 'Tile', @stop_movement, @start_movement

Crafty.c 'AI',

  init: ->
    @strategy('bounce_vertical')
    @bind "EnterFrame", @move

  strategy: (type) ->
    @_strategy = type

  move: ->
    @["#{@_strategy}_strategy"]()

  flee_strategy: ->
    # damaged, run!

  chase_strategy: ->
    # chase the hero!

  bounce_vertical_strategy: ->
    # hit a wall, turn around

  bounce_horizontal_strategy: ->
    # hit a wall, turn around

  standing_strategy: ->
    # stand still

  random_strategy: ->
    # random-ish
    # Pick a direction, go that way most likely.
    # Hit a wall, disable that direction from rng
