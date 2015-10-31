require 'bundler/setup'
require 'sinatra'

require 'slim'
require 'sass'

require './lib/authorize'

get '/' do
  @msg = Authorize.get_access_token
  slim :index
end

