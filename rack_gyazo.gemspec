# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rack/gyazo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dan Pickett"]
  gem.email         = ["dpickett@enlightsolutions.com"]
  gem.description   = %q{A Rack Application for Gyazo.app}
  gem.summary       = %q{A Fog-based Rack Application for Gyazo.app}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "rack_gyazo"
  gem.require_paths = ["lib"]
  gem.version       = Rack::Gyazo::VERSION
  
  gem.add_dependency "rack"
  gem.add_dependency "fog"
  gem.add_dependency "rake"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "rack-test"
  gem.add_development_dependency 'rb-fsevent'
  gem.add_development_dependency 'growl_notify'
end
