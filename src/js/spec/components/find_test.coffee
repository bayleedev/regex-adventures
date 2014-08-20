subject = Crafty

describe 'Selector', ->

  describe 'given a few items', ->

    beforeEach (done) ->
      Crafty('Tile').each ->
        @destroy()
      Crafty.e('Tile').at(1, 1, 0)
      Crafty.e('Tile').at(1, 2, 0)
      Crafty.e('Tile').at(1, 3, 1).meow = true
      Crafty.e('Meow, Tile').at(1, 1, 1)
      done()

    it 'will returns 4 tiles', ->
      expect(subject.find('Tile').length).to.equal(4)

    it 'will returns 1 meow', ->
      expect(subject.find('Meow').length).to.equal(1)

    it 'will return 2 at x1 y1', ->
      expect(subject.find('Tile', {at: {x: 1, y: 1}}).length).to.equal(2)

    it 'will return 2 at level 0', ->
      expect(subject.find('Tile', {at: {level: 0}}).length).to.equal(2)

    it 'will match the weird attribute', ->
      expect(subject.find('Tile', {meow: true}).length).to.equal(1)
