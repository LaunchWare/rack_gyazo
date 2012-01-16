module Gyazo
  class Image
    attr_reader :file
    def initialize(upload_data)
      @file = upload_data[:tempfile]
    end

    def upload
      @url = self.adapter.upload
    end

    def url
      @url
    end

    def data
      @data ||= @file.read
    end

    def name
      @name ||= Digest::MD5.hexdigest(data).to_s + ".jpg"
    end

    protected
    def adapter
      @adapter ||= self.class.adapter_class.new(self)
    end

    class << self
      def adapter_class
        @adapter || ::Gyazo::UploadAdapters::Fog
      end

      def adapter=(sym_or_klass)
        if sym_or_klass.kind_of?(Symbol)
          @adapter = adapter_map[sym_or_klass]
        else
          @adapter = sym_or_klass
        end
      end

      protected
      def adapter_map
        {
          :fog => ::Gyazo::UploadAdapters::Fog
        }
      end
    end
  end
end

