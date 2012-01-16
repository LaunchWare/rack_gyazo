# RackGyazo

This rack application is the server side implementation of the excellent gyazo.com application for taking quick screen shots

## Installation

Create a new directory and add a Gemfile. Add this line:

    gem 'rack_gyazo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack_gyazo

In the same directory create a rack configuration file (config.ru) like the following:

```ruby
    require 'rubygems'
    require 'bundler/setup'
    Bundler.require

    require 'rack_gyazo'
    Rack::Gyazo.configure_with({
      :adapter_options => {
        :provider   => 'AWS',
        :aws_access_key_id => "Access Key",
        :aws_secret_access_key => "Secret Key"
      },
      :bucket => "bucket_name"
    })
    run Rack::Gyazo::Application.new
```

Modify your /Applications/Gyazo.app/Contents/Resources/script to point to your server (at the time of this writing, it can be found at line 41)
  
```ruby
  HOST = 'example.com'
  CGI = '/uploads'
```

## Usage

When you take screenshots with gyazo.app, it will now upload them to s3

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
