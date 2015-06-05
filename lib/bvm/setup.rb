require 'bvm/environment'

environment = BVM::Environment.new(ARGV)
version = environment.bundler_version

begin
  gem 'bundler', version
rescue LoadError
  Gem.install('bundler', version)
  retry
end

require 'bundler/version'
