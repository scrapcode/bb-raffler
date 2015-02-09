class BbRaffler.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  events:
    'submit #new_entry': 'createEntry'
    'click #draw': 'drawWinner'
    'click #reset': 'resetWinners'
    'click .remove': 'removeWinner'
    'click #edit': 'toggleEdit'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @render, this)
    @collection.on('destroy', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendEntry)
    this

  toggleEdit: (event) ->
    $('.remove').toggle()

  createEntry: (event) ->
    event.preventDefault()
    attributes = name: $('#new_entry_name').val()
    @collection.create attributes,
      wait: true,
      success: -> $('#new_entry')[0].reset()
      error: @handleError

  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

  appendEntry: (entry) ->
    view = new BbRaffler.Views.Entry(model: entry)
    $('#entries').append(view.render().el)

  drawWinner: (event) ->
    event.preventDefault()
    @collection.drawWinner()

  resetWinners: (event) ->
    event.preventDefault()
    @collection.resetWinners()

  removeWinner: (event) ->
    event.preventDefault()
    id = $(event.currentTarget).data('id')
    @collection.get(id).destroy()
