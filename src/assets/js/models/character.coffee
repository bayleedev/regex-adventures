class Character

  @tiles:
    character_boy:
      symbol: '1'
    character_cat_girl:
      symbol: '2'
    character_horn_girl:
      symbol: '3'
    character_pink_girl:
      symbol: '4'
    character_princess_girl:
      symbol: '5'

  @fromLetter: (letter) ->
    for key, value of @tiles
      if value.symbol == letter
        return key

  @tile: (name) ->
    @tiles[name]

window.Character = Character
