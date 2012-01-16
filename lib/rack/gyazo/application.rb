module Rack
  module Gyazo
    class Application
      attr_reader :image, :request

      def call(env)
        @env = env
        load_request
        if request.path == "/uploads" && request.post?
          load_image
          if !image.nil?
            image.upload
            [200, {'Content-Type' => 'text/plain'}, StringIO.new(image.url)]
          else
            [422, {'Content-Type' => 'text/plain'}, StringIO.new('imagedata not specified')]
          end
        else
          [404, {'Content-Type' => 'text/plain'}, StringIO.new('file not found')]
        end
      end

      protected
      def load_request
        @request = Rack::Request.new(@env)
      end

      def load_image
        if request.params["imagedata"]
          @image = ::Gyazo::Image.new(request.params["imagedata"])
        end
      end
    end
  end
end
