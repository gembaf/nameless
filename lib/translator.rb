require './lib/open-uri-post'
require 'rexml/document'

TRANSLATION_URL = 'http://api.microsofttranslator.com/V2/Http.svc/Translate'

class Translator
  Languages = [
    'ja', # Japanese
    'en', # English
    'fr', # French
    'de', # German
    'it', # Italian
    'ru', # Russian
    'es', # Spanish
    'el' # Greek
  ]

  def initialize(access_token)
    @access_token = access_token
  end

  def translate(text, from, to)
    uri = "#{TRANSLATION_URL}?from=#{from}&to=#{to}&text=#{URI.escape(text)}"
    res = open(uri, 'Authorization' => "Bearer #{@access_token}").read
    xml = REXML::Document.new(res)
    xml.root.text
  end

  def translate_from_en(text)
    result = []
    Languages.each do |lang|
      next if lang == 'en'
      result << { language: lang, text: translate(text, 'en', lang) }
    end
    result
  end
end

