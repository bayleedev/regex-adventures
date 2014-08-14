Crafty.scene "Start", ->
  game.board().load_level('one')

  Crafty.e("Title").at(0, 5).text "Regex Adventures"

  Crafty.e("Subtitle").at(0, 10).text "Press any key to continue"

  Crafty.e("Keyboard").one 'KeyDown', ->
    return
    Crafty.scene 'Game'
