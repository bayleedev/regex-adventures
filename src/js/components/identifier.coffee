Crafty.c 'Identifier',

  init: ->
    @identifier = Crafty.e('Text, 2D, DOM')
      .textFont size: '13px'
      .css
        'text-align': 'center'
        'background-color': 'rgba(255,255,255,0.65)'
      .attr
        h: 15
        w: 40
        z: @z+5
    @bind 'Move', @position

  identify: (text) ->
    @identifier.text text

  position: ->
    @identifier.attr
      x: @x+30
      y: @y+40

