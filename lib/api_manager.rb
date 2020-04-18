class LookeyMonster::APIManager
  
  BASE_URL = "https://api.getsongbpm.com"
  APIKEY = "4a45338f3b72c92981ea4c26c94ebf61"
  def self.get_song_info
    url = BASE_URL + "/song/"
    res = HTTParty.get(url)
  end
end