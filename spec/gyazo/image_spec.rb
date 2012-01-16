require 'spec_helper'

describe Gyazo::Image do
  let(:file_path) do
    File.join(File.dirname(__FILE__), "../fixtures/test_image.png")
  end

  let(:file) { File.open(file_path) }
  let(:params) do
    {
      :filename => "test_image.png",
      :type     => "text/plain",
      :name     => "imagedata",
      :tempfile => file,
      :head=>
        "Content-Disposition: form-data; name=\"imagedata\"; filename=\"test_image.png\"\r\nContent-Type: text/plain\r\nContent-Length: 35885\r\n"
    }
  end

  subject { ::Gyazo::Image.new(params) }

  describe "uploading" do
    it "delegates to the upload adapter" do
      mock_adapter = mock
      mock_adapter.expects(:upload).returns("http://www.example.com")
      ::Gyazo::Image.adapter = mock_adapter
      subject.upload
    end
  end

  describe "upload adapters" do
    it "allows the client to specify a symbol as an adapter" do
      ::Gyazo::Image.adapter = :fog
      ::Gyazo::Image.adapter.should be_kind_of(::Gyazo::UploadAdapters::Fog)
    end
  end

end

