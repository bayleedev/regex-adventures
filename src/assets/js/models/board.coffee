Crafty.c "Board",

  levels:
    one: [
      [
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
        ['d', 'd', 's', 's', 's', 's', 's', 'd', 'd', 'd']
        ['d', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd', 'd']
      ]
      [
        ['g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g']
        ['g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g']
        ['g', 'g', 's', 's', 's', 's', 's', 'g', 'g', 'g']
        ['g', 'g', 's', 'w', 'w', 'w', 's', 'g', 'g', 'g']
        ['g', 'g', 's', 'w', 's', 'w', 's', 'g', 'g', 'g']
        ['g', 'g', 's', 'w', 'w', 'w', 's', 'g', 'g', 'g']
        ['g', 'g', 's', 's', 's', 's', 's', 'g', 'g', 'g']
        ['g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g']
      ]
      [
        []
        []
        []
        []
        ['', '', '', '', 'selector']
      ]
    ]

  init: ->
    @requires('Model')

  map_grid:
    width: 10
    height: 8
    tile:
      bleed_width: 101
      width: 101
      bleed_height: 171
      height: 83

  load: (board) ->
    for l, level of board
      for y, row of level
        for x, cell of row
          console.log x, y, cell
          if cell == 'g'
            Crafty.e("Tile, grass_block").at(x,y - 1,l)
          else if cell == 'd'
            Crafty.e("Tile, dirt_block").at(x,y - 1,l)
          else if cell == 'w'
            Crafty.e("Tile, water_block").at(x,y - 1,l)
          else if cell == 's'
            Crafty.e("Tile, stone_block").at(x,y - 1,l)
          else if cell == 're'
            Crafty.e("Tile, ramp_east").at(x,y - 1,l)
          else if cell == 'rw'
            Crafty.e("Tile, ramp_west").at(x,y - 1,l)
          else if cell.length > 1
            Crafty.e("Tile, #{cell}").at(x,y - 1,l)

  load_level: (name) ->
    @load(@levels[name])

  tile_width: ->
    @map_grid.tile.width

  tile_height: ->
    @map_grid.tile.height

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
