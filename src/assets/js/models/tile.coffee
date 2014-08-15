class Tile

  @tiles:
    grass_block:
      solid: true
      symbol: 'g'
    dirt_block:
      solid: true
      symbol: 'd'
    water_block:
      solid: false
      symbol: 'w'
    stone_block:
      solid: true
      symbol: 's'
    ramp_east: # kinda?
      solid: true
      symbol: '\\'
    ramp_west:
      solid: true
      symbol: '/'
    selector:
      solid: false
      symbol: '!'

  @fromLetter: (letter) ->
    for key, value of @tiles
      if value.symbol == letter
        return key

  @tile: (name) ->
    @tiles[name]

window.Tile = Tile
