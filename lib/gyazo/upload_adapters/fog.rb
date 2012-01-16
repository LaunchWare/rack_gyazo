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
        ["http://#{host}", image.name].compact.join('/')
      end

      protected
      def host
        configuration.cname.nil? ? "#{bucket}.s3.amazonaws.com" : configuration.cname
      end

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

