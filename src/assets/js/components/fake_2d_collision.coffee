Crafty.c "Fake2DCollision",

  allowed:
    right: true
    left: true
    up: true
    down: true

  prevent_collision: ->
    @on_hit 'Tile', ->
      console.log 'hit!'
    , ->
      console.log 'un-hit!'

  on_hit: (components, callback_on, callback_off) ->
    just_hit = false
    @bind "EnterFrame", =>
      if hitdata = @hit(components)
        return if just_hit
        just_hit = true
        callback_on.call @, hitdata if callback_on?
      else if just_hit
        just_hit = false
        callback_off.call @ if callback_off?
      @

  # Checks to see if I hit a component
  hit: (components) ->
    rect1 = @solid_at()
    for key, value of Crafty("PartialSolid #{components}")
      continue if isNaN(key)
      component = Crafty(value)
      rect2 = component.solid_at()
      return true if component != @ and  # Dont match itself
        component.at().z is @at().z and  # Same z level
        rect1.x < rect2.x + rect2.w and  # Basic collision detection
        rect1.x + rect1.w > rect2.x and
        rect1.y < rect2.y + rect2.h and
        rect1.h + rect1.y > rect2.y
    false
