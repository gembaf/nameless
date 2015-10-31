require 'cgi'
require './lib/open-uri-post'
require 'json'

CLIENT_ID = ENV['CLIENT_ID']
CLIENT_SECRET = ENV['CLIENT_SECRET']
AUTHORIZE_URL = 'https://datamarket.accesscontrol.windows.net/v2/OAuth2-13'
SCOPE = 'http://api.microsofttranslator.com'

module Authorize
  def get_access_token
    access_token = nil
    postdata = {
      grant_type: 'client_credentials',
      client_id: CGI.escape(CLIENT_ID),
      client_secret: CGI.escape(CLIENT_SECRET),
      scope: CGI.escape(SCOPE)
    }.to_a.map { |data| data.join('=') }.join('&')

    open(AUTHORIZE_URL, 'postdata' => postdata) do |f|
      res = JSON.parse f.read
      access_token = res['access_token']
    end
    access_token
  end

  module_function :get_access_token
end

