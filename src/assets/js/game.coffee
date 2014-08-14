class Game
  models: {}

  board: ->
    @_board ||= Crafty.e('Board')

  start: =>
    Crafty.init @board().width(), @board().height()
    Crafty.background "Silver"
    Crafty.scene "Start"
    Crafty.timer.FPS 10

window.game = new Game
