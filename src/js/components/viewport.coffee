Crafty.c "Viewport",

  # Entity that should be the center
  center: null

  percent:
    x: 0.90
    y: 0.85

  center: (center, time = 75) ->
    @center = center
    center.bind "Move", =>
      @recenter(time)

  recenter: (time) ->
    height = Crafty.viewport.height
    width = Crafty.viewport.width
    solid = @center.solid_at()
    speed = @center._speed
    relative_x = solid.x + Crafty.viewport.x
    relative_y = solid.y + Crafty.viewport.y
    if width * (1 - @percent.x) > relative_x
      Crafty.viewport.x += speed.x # Left
    else if height * (1 - @percent.y) > relative_y
      Crafty.viewport.y += speed.y # Top
    else if width * @percent.x < relative_x + solid.w
      Crafty.viewport.x -= speed.x # Right
    else if height * @percent.y < relative_y + solid.h
      Crafty.viewport.y -= speed.y # Bottom
