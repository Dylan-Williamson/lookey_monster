require 'pry'
config = {
  :access_token => 'tBQCaxleGyRehiCGGKR70-BnjIIUoocl2drUt9PZUbuckwI2gHNxLPhspHv_DZQzNvyrBRIVTAqy7cMFyoig9ovSVklM49PrNF3biJLnDu31WX3QtI-4_7bNYASDWCGlGf-xoHG7x-2VNmg',  # initialize the client with an access token to perform authenticated calls
  :raise_errors => true,  # choose between returning false or raising a proper exception when API calls fails

  # Connection properties
  :retries       => 0,    # automatically retry a certain number of times before returning
  :read_timeout  => 10,   # set longer read_timeout, default is 10 seconds
  :write_timeout => 10,   # set longer write_timeout, default is 10 seconds
  :persistent    => false # when true, make multiple requests calls using a single persistent connection. Use +close_connection+ method on the client to manually clean up sockets
}
client = Spotify::Client.new(config)
# # or with default options:
# client = Spotify::Client.new
end

binding.pry

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