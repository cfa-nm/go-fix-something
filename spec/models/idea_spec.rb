require 'spec_helper'

describe Idea do
  let(:user) { build(:user) }

  subject { build(:idea) }

  describe "Voting" do
    it "should allow a user to upvote" do
      expect{subject.upvote(user)}.to change{subject.vote_total}.by(1)
    end

    it "should not allow the owner to vote" do
      idea = build(:idea, user: user)
      expect{idea.upvote(user)}.not_to change{subject.vote_total}
    end

    it "should not allow a user to vote twice" do
      expect{2.times{subject.upvote(user)}}.to change{subject.vote_total}.by(1)
    end

    it "should remove a user's downvote before adding their upvote" do
      subject.downvote(user)
      expect{subject.upvote(user)}.to change{subject.vote_total}.by(2)
    end
  end
end
