subject = Tile

describe 'Tile Class', ->

  beforeEach (done) ->
    Tile.tiles =
      foo:
        solid: true
        symbol: 'f'
      bar:
        solid: true
        symbol: 'b'
    done()

  describe '.fromLetter', ->
    it 'gives back key', ->
      expect(subject.fromLetter('b')).to.equal('bar')

  describe '.tile', ->
    it 'gives back details about the tile', ->
      expect(subject.tile('bar')).to.deep.equal
        solid: true
        symbol: 'b'
