subject = game.board()

describe 'Board', ->

  beforeEach (done) ->
    Crafty('Grid').each ->
      @destroy()
    done()

  describe '#taken', ->

    beforeEach (done) ->
      Crafty.e('Solid, Grid').at(1, 1)
      done()

    it 'is not taken on 0,0', ->
      expect(subject.taken(0,0)).to.be.false

    it 'is taken on 1,1', ->
      expect(subject.taken(1,1)).to.be.true

  describe '#width', ->

    beforeEach (done) ->
      subject.map_grid.width = 10
      subject.map_grid.tile.width = 5
      done()

    it 'returns tiles wide * tile width', ->
      expect(subject.width()).to.equal(50)

  describe '#height', ->

    beforeEach (done) ->
      subject.map_grid.height = 10
      subject.map_grid.tile.height = 6
      done()

    it 'returns tiles high * tile height', ->
      expect(subject.height()).to.equal(60)

  describe '#at', ->
    first = second = null

    describe 'single item', ->

      beforeEach (done) ->
        first = Crafty.e('Solid, Grid').at(1,1)
        done()

      it 'returns a single object', ->
        expect(subject.at(1, 1).length).to.equal(1)

      it 'gives specific created item', ->
        expect(subject.at(1, 1)[0]).to.equal(first)

    describe 'multiple items', ->

      beforeEach (done) ->
        first = Crafty.e('Solid, Grid').at(1,1)
        second = Crafty.e('Solid, Grid').at(1,1)
        done()

      it 'returns a single object', ->
        expect(subject.at(1, 1).length).to.equal(2)

      it 'first item gives specific created item', ->
        expect(subject.at(1, 1)[0]).to.equal(first)

      it 'second item gives specific created item', ->
        expect(subject.at(1, 1)[1]).to.equal(second)
