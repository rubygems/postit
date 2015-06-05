module BVM
  class Parser
    def initialize(file)
      @file = file
    end

    def parse
      lockfile = File.read(@file) if File.file?(@file)
      return unless lockfile
      if lockfile =~ /\n\nBUNDLED WITH\n\s{2,}(#{Gem::Version::VERSION_PATTERN})\n/
        $1
      end
    end
  end
end
