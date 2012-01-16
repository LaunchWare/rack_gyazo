require 'rubygems'
require 'bundler/setup'
Bundler.require

$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'rack_gyazo'
run Rack::Gyazo::Application.new