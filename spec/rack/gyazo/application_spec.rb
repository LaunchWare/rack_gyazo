require 'spec_helper'

describe Rack::Gyazo::Application do
  include Rack::Test::Methods

  let(:image_path) do
    File.join(File.dirname(__FILE__), "../../fixtures/test_image.png")
  end

  let(:image) { File.open(image_path) }
  
  def app
    Rack::Gyazo::Application.new
  end
  
  it "returns a 404 if the path isn't /uploads" do
    post '/'
    last_response.should_not be_ok
    last_response.status.should eql(404)
  end

  it "returns a 404 if the method isn't post" do
    get "/uploads"
    last_response.should_not be_ok
    last_response.status.should eql(404)
  end
  
  it "returns a 422 if an upload isn't specified" do
    post "/uploads"
    last_response.should_not be_ok
    last_response.status.should eql(422)
  end
  
  it 'creates an image if I specify one' do
    mock_image = mock('Image')
    mock_image.expects(:upload).once
    mock_image.stubs(:url).returns('http://example.org')
    ::Gyazo::Image.expects(:new).returns(mock_image)

    post '/uploads', :imagedata => Rack::Test::UploadedFile.new(image_path)
    last_response.should be_ok
  end
end

