class VotingWidget.View extends Backbone.View
  template: HandlebarsTemplates['voting_widget']

  events:
    'click .upvote'     : -> @model.upvote()
    'click .downvote'   : -> @model.downvote()
    'click .cancelvote' : -> @model.cancelvote()

  render: ->
    @$el.html(@template(@model.attributes))
    this

  initialize: ->
    @render()
    @listenTo(@model, 'change', @render)
