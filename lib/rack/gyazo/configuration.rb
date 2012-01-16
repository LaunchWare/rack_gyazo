module Rack
  module Gyazo
    class Configuration
      def initialize(options = {})
        @configuration = options
      end

      def [](key)
        @configuration[key]
      end
    end
  end
end

