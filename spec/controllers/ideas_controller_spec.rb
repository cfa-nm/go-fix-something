require 'spec_helper'

describe IdeasController do

  let(:user) { create(:user) }
  let!(:idea) { create(:idea) }

  let(:valid_session) { {} }

  before do
    sign_in user
    request.env["HTTP_REFERER"] = "http://test.host/previous_url"
  end

  describe "PATCH vote" do
    describe "with valid params" do
      it "upvotes" do
        Idea.any_instance.should_receive(:upvote!)
        patch :vote, {id: idea.to_param, type: 'up'}, valid_session
      end

      it "downvotes" do
        Idea.any_instance.should_receive(:downvote!)
        patch :vote, {id: idea.to_param, type: 'down'}, valid_session
      end

      it "cancels votes" do
        Idea.any_instance.should_receive(:cancel_vote!)
        patch :vote, {id: idea.to_param, type: 'cancel'}, valid_session
      end
    end

    it "redirects to back" do
      patch :vote, {id: idea.to_param, type: 'up'}, valid_session
      response.should redirect_to :back
    end
  end

end
