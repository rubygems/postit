require 'postit/version'
require 'postit/environment'
require 'postit/parser'
require 'rubygems'

module PostIt
  def self.setup
    load File.expand_path('../postit/setup.rb', __FILE__)
  end

  def self.bundler_version
    defined?(Bundler::VERSION) && Bundler::VERSION
  end
end
