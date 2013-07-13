require 'spec_helper'

describe ApplicationHelper do
  describe :modal do
    subject do
      helper.modal(:foo, class: 'bar') { "the content" }
    end

    it { should have_css "#foo.bar.reveal-modal" }
    it { should include "the content" }
  end
end
