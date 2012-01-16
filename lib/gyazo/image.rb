module Gyazo
  class Image
    attr_reader :file
    def initialize(upload_data)
      @file = upload_data["tempfile"]
    end

    def upload
      self.class.adapter.upload(self)
    end

    class << self
      def adapter
        @adapter || ::Gyazo::UploadAdapters::Fog.new
      end

      def adapter=(sym_or_klass)
        if sym_or_klass.kind_of?(Symbol)
          @adapter = adapter_map[sym_or_klass].new
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
