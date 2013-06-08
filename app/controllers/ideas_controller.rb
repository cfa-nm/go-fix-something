class IdeasController < ApplicationController
  respond_to :html, :json
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

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

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:text, :user_id)
    end
end
