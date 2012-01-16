module Rack
  module Gyazo
    class Application 
      def call(env)
        @env = env
        if request.path == "/uploads" && request.post?
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
      def request
        @request ||= Rack::Request.new(@env)
      end

      def image
        if request.params["imagedata"]
          @image ||= ::Gyazo::Image.new(request.params["imagedata"])
        else
          nil
        end
      end
    end
  end
end
