Crafty.c "Viewport",

  # Entity that should be the center
  center: null

  percent:
    x: 0.85
    y: 0.85

  center: (center) ->
    @center = center
    center.bind "Move", =>
      console.log 'calling'
      @recenter() if @recenter_x() or @recenter_y()

  recenter_y: ->
    height = Crafty.viewport.height
    y = @center.y + Crafty.viewport.y
    if height * (1 - @percent.y) > y or height * @percent.y < y
      true
    else
      false

  recenter_x: ->
    width = Crafty.viewport.width
    x = @center.x + Crafty.viewport.x
    if width * (1 - @percent.x) > x or width * @percent.x < x
      true
    else
      false

  # Not working...
  recenter: ->
    Crafty.viewport.centerOn(@center, 60)
