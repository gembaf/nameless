require 'bundler/setup'
require 'sinatra'

require 'slim'
require 'sass'

require './lib/authorize'
require './lib/translator'

get '/' do
  token = Authorize.get_access_token
  translator = Translator.new(token)
  @msg = translator.translate_from_en('black')
  slim :index
end

