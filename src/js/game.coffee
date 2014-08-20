class Game
  models: {}

  board: ->
    @_board ||= Crafty.e('Board')

  start: =>
    Crafty.init @board().width(), @board().height()
    Crafty.viewport.scale(0.65)
    Crafty.background "Silver"
    Crafty.scene "Start"

window.game = new Game
