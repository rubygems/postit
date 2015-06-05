version = ENV['BUNDLER_VERSION']
if str = ARGV.first
  str = str.dup.force_encoding("BINARY") if str.respond_to? :force_encoding
  if Gem::Version.correct?(str)
    ARGV.shift
    version ||= str
  end
end
# if File.file?('.bundler-version')
#   version ||= File.read('.bundler-version')
# end

gemfile = ENV['BUNDLE_GEMFILE'] || 'Gemfile'
lockfile = case File.basename(gemfile)
           when 'gems.rb' then gemfile.sub(/\.rb$/, gemfile)
           else "#{gemfile}.lock"
           end
lockfile = File.expand_path(lockfile)

version ||= BVM::Parser.new(lockfile).parse
version ||= Gem::Requirement.default

gem 'bundler', version
require 'bundler/version'
