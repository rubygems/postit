require 'postit/environment'
require 'postit/installer'

environment = PostIt::Environment.new(ARGV)
version = environment.bundler_version

installer = PostIt::Installer.new(version)
installer.install!

require 'bundler/version'
