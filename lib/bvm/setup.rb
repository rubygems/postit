require 'bvm/environment'

environment = BVM::Environment.new(ARGV)
version = environment.bundler_version

begin
  gem 'bundler', version
rescue Gem::LoadError
  raise Gem::LoadError, "Unable to find bundler (#{version}). " \
    "Please run `gem install bundler -v #{version}` and try again."
end

require 'bundler/version'
