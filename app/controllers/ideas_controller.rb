class IdeasController < InheritedResources::Base
  respond_to :html, :json
  decorates_assigned :idea

  custom_actions resource: [:upvote, :downvote, :cancel_vote, :promote]

  def upvote
    upvote! { |format| vote(:up, format) }
  end

  def downvote
    downvote! { |format| vote(:down, format) }
  end

  def cancel_vote
    cancel_vote! { |format| vote(:cancel, format) }
  end

  def promote
    promote! { @idea.promote! }
  end

  private

  def permitted_params
    params.permit(idea: [:text, :user_id])
  end

  def vote(type, format)
    case type
    when :up     then @idea.upvote(current_user)
    when :down   then @idea.downvote(current_user)
    when :cancel then @idea.cancel_vote(current_user)
    end
    @idea.save

    format.html { redirect_to :back }
    format.json { render json: { vote_total: @idea.vote_total } }
  end
end
