module BVM
  class Parser
    def initialize(file)
      @file = file
    end

    BUNDLED_WITH =
      /\n\nBUNDLED WITH\n\s{2,}(#{Gem::Version::VERSION_PATTERN})\n/

    def parse
      lockfile = File.read(@file) if File.file?(@file)
      return unless lockfile
      if lockfile =~ BUNDLED_WITH
        Regexp.last_match(1)
      else
        '< 1.10'
      end
    end
  end
end
