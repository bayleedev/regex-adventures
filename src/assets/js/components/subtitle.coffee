Crafty.c "Subtitle",
  init: ->
    @requires("DOM, 2D, Text, Grid")
      .textFont(size: "20px")
      .css("text-align": "center")
      .attr
        w: game.board().width()
