subject = null
tiles = null

describe 'Tile Z Switcher', ->

  beforeEach (done) ->
    subject = Crafty.e("Character, TileZSwitcher").attr({z: 2, y: 10, level: 1})
    tiles = [
      Crafty.e("Tile").attr({z: 4, y: 100, level: 1})
      Crafty.e("Tile").attr({z: 4, y: 100, level: 0})
    ]
    done()

  describe '#moved', ->

    beforeEach (done) ->
      subject.moved()
      done()

    describe 'given the character is above the tiles', ->

      it 'sets the same level tile to z of 3', ->
        expect(tiles[0].z).to.equal(3)

      it 'leaves the other leveled tile alone', ->
        expect(tiles[1].z).to.equal(4)

    describe 'given the character is below the tiles', ->

      beforeEach (done) ->
        subject.attr({y: 200})
        subject.moved()
        done()

      it 'sets the same level tile to z of 1', ->
        expect(tiles[0].z).to.equal(1)

      it 'leaves the other leveled tile alone', ->
        expect(tiles[1].z).to.equal(4)
