class LookeyMonster::APIManager
  BASE_URL = "https://api.getsongbpm.com"
  
  def self.get_song_info
    api_key = "4a45338f3b72c92981ea4c26c94ebf61"
    url = BASE_URL + "/song/"
    res = HTTParty.get(url, :headers => {
      "X-Api-Key" => "#{api_key}"})
  end
end