class LookeyMonster::APIManager
  
  BASE_URL = "https://api.getsongbpm.com"
  params = {"X-API-KEY" => ENV['APIKEY']}
  def self.get_song_info
    url = BASE_URL + "/song/"
    res = HTTParty.get(url, :params => params)
  end
end