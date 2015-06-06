require 'rubygems'
GEMSPEC = Gem::Specification.load('postit.gemspec')

desc "Installs all development dependencies"
task :bootstrap do
  GEMSPEC.development_dependencies.each do |dep|
    sh 'gem', 'install', dep.name, '-v', dep.requirement.to_s
  end
end

begin
GEMSPEC.development_dependencies.each do |dep|
  gem dep.name, dep.requirement.to_s
end

require 'bundler/gem_tasks'
require 'tmpdir'

desc 'Run the specs'
task :spec do
  puts 'Running specs...'
  files = FileList['spec/**/*_spec.sh'].shuffle.map { |s| File.expand_path(s) }
  files.each do |spec|
    Dir.mktmpdir do |dir|
      Dir.chdir(dir) do
        rubyopt = "RUBYOPT='-I#{File.expand_path('../lib', __FILE__)}'"
        path = %(PATH="#{File.expand_path('../exe', __FILE__)}:$PATH")
        sh "#{rubyopt} #{path} sh '#{spec}'", verbose: false
      end
    end
  end
  puts "\n\n"
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new

task :ci => [:spec, :rubocop]

rescue LoadError, NameError
  warn "Please run rake bootstrap"
end
