require 'spec_helper'

describe Rack::Gyazo do
  let(:configuration) do
    {
      :adapter               => :fog,
      :bucket                => "some_bucket",
      :adapter_options       => {
        :provider              => :aws,
        :aws_access_key        => "access_key",
        :aws_secret_access_key => "secret_key"
      }
    }
  end
  it "allows me to configure arbitrary options" do
    Rack::Gyazo.configure_with(configuration)
  end

  it "defaults to a blank configuration" do
    Rack::Gyazo.configuration.should_not be_nil
  end
end

