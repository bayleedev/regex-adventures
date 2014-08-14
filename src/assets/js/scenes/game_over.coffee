Crafty.scene "GameOver", ->

  Crafty.e("Borders")

  Crafty.e("Title").at(0, 5).text "Game Over!"

  Crafty.e("Subtitle").at(0, 10).text "Total Points: x"

  Crafty.e("Subtitle").at(0, 12).text "Press any key to continue"

  Crafty.e("Keyboard").one 'KeyDown', ->
    Crafty.scene 'Game'
