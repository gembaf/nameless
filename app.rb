require 'bundler/setup'
require 'sinatra'

require 'slim'
require 'sass'

get '/' do
  @msg = ENV['HOGE']
  slim :index
end

