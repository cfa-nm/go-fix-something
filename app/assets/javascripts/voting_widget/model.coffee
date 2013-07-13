class VotingWidget.Model extends Backbone.Model
  defaults:
    voteTotal: 0
    ideaId: null

  initialize: (attributes) ->
    @set(
      canUpvote: attributes.canUpvote?
      canDownvote: attributes.canDownvote?
      canCancelVote: attributes.canCancelVote?
    )

  upvote: ->
    return unless @get('canUpvote')

    $.ajax(
      url: Routes.voteIdeaPath(@get('ideaId'), format: 'json')
      type: 'PATCH'
      data: { type: 'up' }
    ).done (data) =>
      @set(voteTotal: data.vote_total)

    @set
      canUpvote: false
      canDownvote: true
      canCancelVote: true

  downvote: ->
    return unless @get('canDownvote')

    $.ajax(
      url: Routes.voteIdeaPath(@get('ideaId'), format: 'json')
      type: 'PATCH'
      data: { type: 'down' }
    ).done (data) =>
      @set(voteTotal: data.vote_total)

    @set
      canUpvote: true
      canDownvote: false
      canCancelVote: true

  cancelvote: ->
    return unless @get('canCancelVote')

    $.ajax(
      url: Routes.voteIdeaPath(@get('ideaId'), format: 'json')
      type: 'PATCH'
      data: { type: 'cancel' }
    ).done (data) =>
      @set(voteTotal: data.vote_total)

    @set
      canUpvote: true
      canDownvote: true
      canCancelVote: false
