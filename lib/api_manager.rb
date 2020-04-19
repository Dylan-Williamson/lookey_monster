class LookeyMonster::APIManager
  include HTTParty
  base_uri "api.spotify.com/v1"
  
  def initialize
    
  end
  
  def search
    self.class.get('/recommendations')
  end
end

lookey_monster = LookeyMonster::APIManager.new
puts lookey_monster.search






# apikey = 4a45338f3b72c92981ea4c26c94ebf61
# Web API Base URL	https://api.getsongbpm.com
# Method	GET
# Authorization	A valid API Key must be sent with all client requests, either via URL_PARAM (api_key), or a X-API-KEY header parameter



  # BASE_URL = "https://api.getsongbpm.com"
  # def self.get_song_info
  #   api_key = "a3bcc84a45bec951478f76570591a0fe"
  #   url = BASE_URL + "/song"
  #   headers = {"X-API-KEY" => api_key}
  #   query = {"api_key" => api_key} 
  #   res = HTTParty.get(url, query: query)
  # end