Crafty.c "Board",

  levels:
    one: [
      [
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
        ['d', 'd', 'd', 's', 's', 's', 's', 's', 'd', 'd', 'd']
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
      ]
      [
        ['g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g']
        ['g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g']
        ['g', 'g', 'g', 's', 's', 's', 's', 's', 'g', 'g', 'g']
        ['g', 'g', 'g', 's', 'w', 'w', 'w', 's', 'g', 'g', 'g']
        ['g', 'g', '/', 's', 'w', 's', 'w', 's', '\\', 'g', 'g']
        ['g', 'g', 'g', 's', 'w', 'w', 'w', 's', 'g', 'g', 'g']
        ['g', 'g', 'g', 's', 's', 's', 's', 's', 'g', 'g', 'g']
        ['g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g']
      ]
      [
        []
        []
        []
        []
        ['', '', '', '', '', '!']
      ]
    ]

  init: ->
    @requires('Model')

  map_grid:
    width: 11
    height: 8
    tile:
      width: 101
      height: 83
      level: 40

  load: (board) ->
    for l, level of board
      for y, row of level
        for x, cell of row
          if type = Tile.fromLetter(cell)
            Crafty.e("Tile, #{type}").at(x,y - 1,Number(l))

  load_level: (name) ->
    @load(@levels[name])

  tile_width: ->
    @map_grid.tile.width

  tile_height: ->
    @map_grid.tile.height

  z_height: ->
    @map_grid.tile.level

  # what level is a specific grid at?
  level: ->
    results = []
    for id in Crafty(type)
      item = Crafty(id)
      at = item.at()
      results.push(item) if at.x is x and at.y is y
    results

  grid_width: ->
    @map_grid.width

  grid_height: ->
    @map_grid.width

  width: ->
    @map_grid.width * @map_grid.tile.width

  height: ->
    @map_grid.height * @map_grid.tile.height

  last_bottom_block: ->
    @map_grid.height - 1

  last_right_block: ->
    @map_grid.width - 1

  grid_width: ->
    @map_grid.tile.width

  grid_height: ->
    @map_grid.tile.width

  # Return all items at a given coords
  at: (x, y, type = 'Solid Grid') ->
    results = []
    for id in Crafty(type)
      item = Crafty(id)
      at = item.at()
      results.push(item) if at.x is x and at.y is y
    results

  taken: (x, y, type = 'Solid Grid') ->
    @at(x, y, type).length > 0
