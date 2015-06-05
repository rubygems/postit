require 'bundler/gem_tasks'
require 'tmpdir'

desc 'Run the specs'
task :spec do
  puts "Running specs"
  FileList['spec/**/*_spec.sh'].shuffle.map { |s| File.expand_path(s) }.each do |spec|
    Dir.mktmpdir do |dir|
      Dir.chdir(dir) do
        sh "RUBYOPT='-I#{File.expand_path('../lib', __FILE__)}' PATH=\"#{File.expand_path('../exe', __FILE__)}:$PATH\" sh #{spec}", :verbose => false
      end
    end
  end
  puts
end
