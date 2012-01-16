module Rack
  module Gyazo
    class << self
      def configure_with(hash)
        @configuration = Rack::Gyazo::Configuration.new(hash)
      end

      def configuration
        (@configuration || configure_with({}))
      end
    end
  end
end

