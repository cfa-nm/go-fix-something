class IdeasController < InheritedResources::Base
  respond_to :html, :json
  decorates_assigned :idea

  custom_actions resource: [:vote, :promote]

  def vote
    vote! do |format|
      case params[:type]
      when 'up'     then @idea.upvote!(current_user)
      when 'down'   then @idea.downvote!(current_user)
      when 'cancel' then @idea.cancel_vote!(current_user)
      end

      format.html { redirect_to :back }
      format.json { render json: { vote_total: @idea.vote_total } }
    end
  end

  def promote
    promote! { @idea.promote! }
  end

  private

  def permitted_params
    params.permit(idea: [:text, :user_id])
  end
end
