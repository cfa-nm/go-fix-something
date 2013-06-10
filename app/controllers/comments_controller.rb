class CommentsController < ApplicationController
  respond_to :html, :json
  before_action :set_idea
  before_action :set_comment, only: [:edit, :update, :destroy]
  decorates_assigned :comment

  def edit
    respond_with @comment
  end

  def create
    @comment = @idea.comments.create(comment_params)
    respond_with @comment, location: idea_path(@idea)
  end

  def update
    @comment.update(comment_params)
    respond_with @comment, location: idea_path(@idea)
  end

  def destroy
    @comment.destroy
    respond_with @comment, location: idea_path(@idea)
  end

  private
    def set_idea
      @idea = Idea.find(params[:idea_id])
    end

    def set_comment
      @comment = @idea.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text, :author_id)
    end
end

