require 'bundler/setup'
require 'sinatra'

require 'slim'
require 'sass'

get '/' do
  @msg = 'hello nameless'
  slim :index
end

