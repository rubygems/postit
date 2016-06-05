module PostIt
  class Installer
    def initialize(bundler_version)
      @bundler_version = bundler_version
    end

    def install!
      loop do
        begin
          gem 'bundler', @bundler_version
          break
        rescue Gem::LoadError
          nil
        end
        Gem.install('bundler', @bundler_version)
      end
    end
  end
end
