require 'httparty'

class HttpHandler
  include HTTParty
  def self.init(api_key:)
    default_params api_key: api_key
    self
  end
end