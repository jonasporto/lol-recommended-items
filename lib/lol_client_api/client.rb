require 'lol_client_api/http_handler'
require 'lol_client_api/resources/query_methods'
require 'lol_client_api/resources/champion'
require 'lol_client_api/resources/item'

module LOLClientAPI
  class Client

    PROTOCOL = "https://"
    BASE_URL_API = 'global.api.pvp.net/api/lol'
    REGION = 'na'
    VERSION = 'v1.2'
    METHOD = 'static-data'

    def initialize
      @http = HttpHandler.init(api_key: API_KEY)
    end

    def url
      url =* BASE_URL_API, METHOD, REGION, VERSION
      PROTOCOL + url.join('/')
    end
    
    def get(endpoint: nil, data: {})
      resource_url = [url, endpoint].join('/')
      @http.get(resource_url, query: data)
    end
  end
end