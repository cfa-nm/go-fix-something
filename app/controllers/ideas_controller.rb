class IdeasController < ApplicationController
  respond_to :html, :json
  before_action :set_idea,
    only: [:show, :edit, :update, :destroy, :upvote, :downvote, :cancel_vote]
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

  def upvote
    @idea.upvote(current_user).save
    respond_with @idea do |format|
      format.html { redirect_to :back }
    end
  end

  def downvote
    @idea.downvote(current_user).save
    respond_with @idea do |format|
      format.html { redirect_to :back }
    end
  end

  def cancel_vote
    @idea.cancel_vote(current_user).save
    respond_with @idea do |format|
      format.html { redirect_to :back }
    end
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:text, :user_id)
    end
end
