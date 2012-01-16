module Rack
  module Gyazo
    class Configuration
      def initialize(options = {})
        @configuration = options
      end

      def [](key)
        @configuration[key]
      end
      
      def cname
        @configuration[:cname]
      end
    end
  end
end

