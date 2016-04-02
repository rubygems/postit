require 'spec_helper'

describe PostIt::Parser do
  let(:contents) { nil }
  let(:file) { File.expand_path('postit/parser_spec/Gemfile.lock', Dir.tmpdir) }
  subject { described_class.new(file) }

  before do
    FileUtils.mkdir_p(File.dirname(file))
    File.write(file, contents) if contents
  end

  after do
    File.delete(file) if File.file?(file)
  end

  describe "#parse" do
    context "when the file does not exist" do
      it "returns nil" do
        expect(subject.parse).to be_nil
      end
    end

    context "when the lockfile does not contain BUNDLED WITH" do
      let(:contents) { "" }

      it "returns < 1.10" do
        expect(subject.parse).to eq '< 1.10'
      end
    end

    context "when the lockfile contains an invalid BUNDLED WITH" do
      let(:contents) { "\n\nBUNDLED WITH\n   1d1\n" }

      it "returns < 1.10" do
        expect(subject.parse).to eq '< 1.10'
      end
    end

    context "when the lockfile contains an valid BUNDLED WITH" do
      let(:contents) { "\n\nBUNDLED WITH\n   1.0.0.pre.1\n" }

      it "returns 1.0.0.pre.1" do
        expect(subject.parse).to eq '1.0.0.pre.1'
      end
    end
  end
end
