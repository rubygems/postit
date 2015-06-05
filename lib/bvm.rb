require 'bvm/version'
require 'bvm/environment'
require 'bvm/parser'
require 'rubygems'

module BVM
  def self.setup
    load File.expand_path('../bvm/setup.rb', __FILE__)
  end

  def self.bundler_version
    defined?(Bundler::VERSION) && Bundler::VERSION
  end
end
