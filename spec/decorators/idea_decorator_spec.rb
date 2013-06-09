require 'spec_helper'

describe IdeaDecorator do
  let(:idea) { build(:idea) }
  subject { idea.decorate }

  describe :html do
    let(:idea) { build(:idea, text: "Link to http://google.com/.\n\nLine 2") }

    it 'should be in <p> tags' do
      expect(subject.html).to match %r[<p>.*</p>\s*<p>.*</p>]
    end

    it 'should autovivify links' do
      expect(subject.html).to match %r[<a href="(.*)">\1</a>]
    end
  end
end
