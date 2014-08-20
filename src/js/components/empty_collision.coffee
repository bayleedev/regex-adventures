# Detects when you are about to walk over an empty or non-solid spot
Crafty.c "EmptyCollision",

  on_empty_hit: (callback_on, callback_off) ->
    just_hit = false
    @bind "EnterFrame", =>
      hitdata = @empty_hit()
      if hitdata is false
        return if just_hit
        just_hit = true
        callback_on.call @, hitdata, hitdata if callback_on?
      else if just_hit
        just_hit = false
        callback_off.call @ if callback_off?
      @

  empty_hit: ->
    highest_level = game.board().level(@at().x, @at().y, 'Tile Solid')
    if highest_level isnt -1
      highest_level
    else
      false
