window.BbRaffler =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new BbRaffler.Routers.Entries()
    Backbone.history.start()

$(document).ready ->
  BbRaffler.initialize()
