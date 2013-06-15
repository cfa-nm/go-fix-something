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
      url: Routes.upvoteIdeaPath(@get('ideaId'), format: 'json')
      type: 'PATCH'
    ).done (data) =>
      @set(voteTotal: data.vote_total)

    @set
      canUpvote: false
      canDownvote: true
      canCancelVote: true

  downvote: ->
    return unless @get('canDownvote')

    $.ajax(
      url: Routes.downvoteIdeaPath(@get('ideaId'), format: 'json')
      type: 'PATCH'
    ).done (data) =>
      @set(voteTotal: data.vote_total)

    @set
      canUpvote: true
      canDownvote: false
      canCancelVote: true

  cancelvote: ->
    return unless @get('canCancelVote')

    $.ajax(
      url: Routes.cancelVoteIdeaPath(@get('ideaId'), format: 'json')
      type: 'PATCH'
    ).done (data) =>
      @set(voteTotal: data.vote_total)

    @set
      canUpvote: true
      canDownvote: true
      canCancelVote: false
