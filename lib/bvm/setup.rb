require 'bvm/environment'

environment = BVM::Environment.new(ARGV)
version = environment.bundler_version

loop do
  begin
    gem 'bundler', version
    break
  rescue Gem::LoadError
    nil
  end
  Gem.install('bundler', version)
end

require 'bundler/version'
