class LookeyMonster::APIManager
  BASE_URL = "https://api.getsongbpm.com"
  
  def self.get_song_info
    url = BASE_URL + "/song/"
    res = HTTParty.get(url, :headers => {"X-API-KEY" => "#{APIKEY}"})
  end
end