class CommentsController < InheritedResources::Base
  actions :all, except: [:index, :show, :new]
  belongs_to :idea
  respond_to :html, :json
  decorates_assigned :comment

  private

  def permitted_params
    params.permit(comment: [:text, :author_id])
  end
end

