class BbRaffler.Collections.Entries extends Backbone.Collection

  model: BbRaffler.Models.Entry

  url: '/api/entries'

  drawWinner: ->
    winner = @shuffle()[0]
    if winner
      winner.set(winner: true)
      winner.save()
      winner.trigger('highlight')

  resetWinners: ->
    @each (entry) ->
      entry.set(winner: false)
      entry.save()
