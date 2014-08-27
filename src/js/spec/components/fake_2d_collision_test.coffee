subject1 = subject2 = null
subject = (attrs) ->
  target = Crafty.e("Fake2DCollision, Solid, Tile")
  target.solid_at = ->
    attrs
  target

describe 'Fake 2D Collision', ->

  beforeEach (done) ->
    subject1 = subject(x: 0, y: 0, w: 100, h: 100)
    subject2 = subject(x: 200, y: 200, w: 100, h: 100)
    done()

  describe '#hit', ->

    describe 'two entities not near each other', ->
      it 'does not hit', ->
        expect(subject1.hit()).to.equal(false)

    describe 'two entities near each other', ->
      beforeEach (done) ->
        subject1 = subject(x: 150, y: 150, w: 100, h: 100)
        done()
      it 'hit', ->
        expect(subject1.hit()).to.equal(true)

  describe '#on_hit', ->

    spy1 = spy2 = null

    beforeEach (done) ->
      spy1 = sinon.spy()
      spy2 = sinon.spy()
      subject1.on_hit '', spy1, spy2
      subject1.trigger 'EnterFrame'
      done()

    describe 'two entities not near each other', ->
      it 'nothing gets called', ->
        expect(spy1.called).to.equal(false)
        expect(spy2.called).to.equal(false)

    describe 'when I move it over each other', ->
      beforeEach (done) ->
        subject1.hit = -> true
        subject1.trigger 'EnterFrame'
        done()
      it 'does not hit', ->
        expect(spy1.called).to.equal(true)
        expect(spy2.called).to.equal(false)

      describe 'when I move it off each other', ->
        beforeEach (done) ->
          subject1.hit = -> false
          subject1.trigger 'EnterFrame'
          done()
        it 'does not hit', ->
          expect(spy2.called).to.equal(true)
