require 'rubygems'
require 'bundler'

Bundler.require()

require './app'

use Rack::Throttle::Second, :max => 1

run Sinatra::Application
