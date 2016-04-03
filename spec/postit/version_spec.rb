require 'spec_helper'

describe PostIt do
  describe '::VERSION' do
    it 'is well-formed' do
      expect(PostIt::VERSION).to match(Gem::Version::ANCHORED_VERSION_PATTERN)
    end
  end
end
