require 'spec_helper'

describe ApplicationHelper do
  describe :flash_helper do
    before { flash.now[:info] = "Test" }
    subject { helper.flash_messages }

    it { should have_css ".alert-box.info[data-alert]" }
    it { should have_content "Test" }
  end

  describe :modal do
    subject do
      helper.modal(:foo, class: 'bar') { "the content" }
    end

    it { should have_css "#foo.bar.reveal-modal" }
    it { should include "the content" }
  end
end
