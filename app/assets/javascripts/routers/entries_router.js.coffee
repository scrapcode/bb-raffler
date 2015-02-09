class BbRaffler.Routers.Entries extends Backbone.Router
  routes:
    '': 'index'
    'entries/:id': 'show'

  initialize: ->
    @collection = new BbRaffler.Collections.Entries()
    @collection.fetch()

  index: ->
   @entriesIndexView = new BbRaffler.Views.EntriesIndex
      el: $('#container'),
      collection: @collection,
      router: this
    @entriesIndexView.render()

  show: (id) ->
    alert "Entry #{id}"

