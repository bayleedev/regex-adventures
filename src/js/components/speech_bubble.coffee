Crafty.c 'SpeechBubble',

  init: ->
    @bubble = Crafty.e('2D, DOM, speechbubble').attr(z: 100)
    @bubble_text = Crafty.e('Text, 2D, DOM')
      .attr
        h: 80
        w: 85
        z: 101
    @bind 'Move', @_position

  set_bubble_text: (text) ->
    @bubble_text.text text

  _position: ->
    @bubble.attr
      x: @x+80
      y: @y-50
    @bubble_text.attr
      x: @x+90
      y: @y+20

