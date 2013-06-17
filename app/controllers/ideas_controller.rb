class IdeasController < ApplicationController
  respond_to :html, :json
  before_action :set_idea, except: [:index, :new, :create]
  decorates_assigned :idea

  def index
    respond_with @ideas = Idea.all
  end

  def show
    respond_with @idea
  end

  def new
    respond_with @idea = Idea.new
  end

  def edit
    respond_with @idea
  end

  def create
    respond_with @idea = Idea.create(idea_params)
  end

  def update
    respond_with @idea.update(idea_params)
  end

  def destroy
    respond_with @idea.destroy
  end

  # non-restful actions

  def upvote
    vote(:up)
  end

  def downvote
    vote(:down)
  end

  def cancel_vote
    vote(:cancel)
  end

  def promote
    @idea.promote!
    respond_with @idea
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:text, :user_id)
    end

    def vote(type)
      case type
      when :up     then @idea.upvote(current_user)
      when :down   then @idea.downvote(current_user)
      when :cancel then @idea.cancel_vote(current_user)
      end
      @idea.save
      respond_with @idea do |format|
        format.html { redirect_to :back }
        format.json { render json: { vote_total: @idea.vote_total } }
      end
    end
end
