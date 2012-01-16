module Gyazo
  module UploadAdapters
    class Fog
      class << self
        def upload(image)
          @image = image
        end
      end
    end
  end
end

