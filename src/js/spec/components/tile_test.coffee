subject = null

describe 'Tile Entity', ->

  beforeEach (done) ->
    subject = Crafty.e('Tile').at(1, 1)
    done()

  describe '#at', ->
    it 'returns the coordinates', ->
      expect(subject.at()).to.deep.equal(x: 1, y: 1, level: 0)
