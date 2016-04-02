require 'spec_helper'

describe PostIt do
  describe ".setup" do
    it "loads postit/setup.rb" do
      expect(described_class).to receive(:load).with(File.expand_path('../../lib/postit/setup.rb', __FILE__))
      described_class.setup
    end
  end

  describe ".bundler_version" do
    context "when Bundler::VERSION is undefined" do
      before do
        hide_const("Bundler::VERSION")
      end

      it "returns nil" do
        expect(described_class.bundler_version).to be_nil
      end
    end

    context "when Bundler::VERSION is defined" do
      before do
        stub_const("Bundler::VERSION", "1.0.0")
      end

      it "returns nil" do
        expect(described_class.bundler_version).to eq("1.0.0")
      end
    end
  end
end
