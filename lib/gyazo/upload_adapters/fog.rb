require "fog"

module Gyazo
  module UploadAdapters
    class Fog
      attr_reader :image

      def initialize(image)
        @image = image
      end

      def upload
        connection.put_object(bucket, image.name, image.data,
          {
            'Content-Type' => "image/jpeg",
            'x-amz-acl'    => 'public-read'
          }
        )
        public_url
      end

      def public_url
        ["http://#{bucket}.s3.amazonaws.com", image.name].compact.join('/')
      end

      protected
      def path
        "/"
      end

      def connection
        @connection ||= ::Fog::Storage.new(configuration[:adapter_options])
      end

      def bucket
        configuration[:bucket]
      end

      def configuration
        Rack::Gyazo.configuration
      end
    end
  end
end

