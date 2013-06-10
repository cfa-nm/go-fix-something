require 'spec_helper'

describe Comment do
  subject { build_stubbed(:comment) }

  describe :author do
    let!(:user) { create(:user) }

    it "should set the author_id" do
      subject.author = user
      subject.author_id.should == user.id
    end

    it "should unset the author_id" do
      subject.author = nil
      subject.author_id.should == nil
    end

    it "should retrieve the author" do
      subject.author_id = user.id
      subject.author.should == user
    end

    it "should return nil if there is no author" do
      subject.author_id = nil
      subject.author.should == nil
    end
  end
end
