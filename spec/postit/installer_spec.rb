require 'spec_helper'
require 'rubygems/dependency_installer'

describe PostIt::Installer do
  let(:ruby_version) { '>= 0.a' }
  subject { described_class.new(ruby_version) }

  describe '#installed?' do
    it 'recognizes bundler is installed' do
      expect(subject).to be_installed
    end
  end

  describe '#install!' do
    it 'installs bundler' do
      expect(subject).to receive(:installed?).and_return(false)
      expect_any_instance_of(Gem::DependencyInstaller).
        to receive(:install).with('bundler', ruby_version).once
      subject.install!
    end

    it 'does not re-install' do
      expect(subject).to receive(:installed?).and_return(true)
      expect_any_instance_of(Gem::DependencyInstaller).
        to receive(:install).never
      subject.install!
    end
  end
end
