#= require_self
#= require_tree .

@VotingWidget = {}

jQuery ($) ->
  $('.voting-widget').each ->
    $this = $(this)
    model = new VotingWidget.Model($this.data())
    view = new VotingWidget.View(model: model, el: $this)
