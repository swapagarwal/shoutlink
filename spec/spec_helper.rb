require 'rubygems'
require 'bundler'
require 'rack/test'
require 'rspec'
Bundler.require()
require './app'

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }
