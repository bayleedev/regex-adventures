Crafty.c "Title",
  init: ->
    @requires("DOM, 2D, Text, Grid")
      .textFont(size: "25px")
      .css("text-align": "center")
      .attr
        w: game.board().width()
