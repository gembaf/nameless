require './lib/open-uri-post'
require 'rexml/document'

TRANSLATION_URL = 'http://api.microsofttranslator.com/V2/Http.svc/Translate'

class Translator
  def initialize(access_token)
    @access_token = access_token
  end

  def translate(text)
    res = open("#{TRANSLATION_URL}?from=en&to=ja&text=#{URI.escape(text)}",
               'Authorization' => "Bearer #{@access_token}").read
    xml = REXML::Document.new(res)
    xml.root.text
  end
end

