require 'pry'
require 'open-uri'
require_relative './lookey_monster'

class LookeyMonster::Scraper
  
  @@all = []
  
  def self.create_song_hash
    url = "https://tunebat.com/"
    html = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(html)
    songs = {}
    parsed_page.css("div.row main-row").each do |song|
      title = song.css("div.row search-track-name").text
      songs[title] = {
      track: song.css('div.row search-track-name').text,
      artist: song.css('div.row search-artist-name').text,
      key: song.css('div.row search-attribute-value').text.scan(/\d+|\D+/)[0],
      tempo: song.css('div.row search-attribute-value').text.scan(/\d+|\D+/)[3]
      }
    # binding.pry
  end
  songs
  
  def self.search_scraper
    input = gets.chomp
    url = "https://tunebat.com/Search?q="+input.gsub!(" ","+")
    html = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(html)
    song_listings = parsed_page.css('div.search-info-container')
    song_listings.each do |song_listing|
      song = {
        track: song_listing.css('div.row.search-track-name').text,
        artist: song_listing.css('div.row.search-artist-name').text,
        key: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
        tempo: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3] + " BPM"
      }
      @@all << song
    end
    # @@all.each do |song|
    #   LookeyMonster::Song.new
    #   # binding.pry
    # end
  end
  
  def self.all
    @@all
  end

    
  def self.get_top_page
    Nokogiri::HTML(open("https://tunebat.com/"))
  end
  
  def self.scrape_song_index
    get_top_page.css("div.searchResultList.row.main-row")
  end
  
  def self.make_top_songs
    scrape_song_index.each do |song|
      LookeyMonster::Song.new_from_index_page(song)
    end
  end
end



LookeyMonster::Scraper


  # def self.scrape_index_page(index_url)
  #   index_page = Nokogiri::HTML(open(index_url))
  #   songs = []
  #   index_page.css("div.searchResultList.row.main-row").each do |card|
  #     card.css("div.row main-row").each do |song|
  #       song_info_url = "#{song.attr('a.href')}"
  #       song_track = song.css('row search-track-name').text
  #       song_artist = song.css('div.row search-artist-name').text
  #       song_key = song.css('div.row search-attribute-value').text.scan(/\d+|\D+/)[0]
  #       song_tempo = song.css('div.row search-attribute-value').text.scan(/\d+|\D+/)[3]
  #       songs << {track: song_track, artist: song_artist, key: song_key, tempo: song_tempo, url: song_info_url}
  #     end
  #   end
  #   songs
  # end

  # def self.scrape_song_page(song_slug)
  #   song = []
  #   song_page = Nokogiri::HTML(open(song_slug))
  #   links = profile_page.css(".social-icon-container").children.css("a").map { |el| el.attribute('href').value}
  #   links.each do |link|
  #     if link.include?("linkedin")
  #       student[:linkedin] = link
  #     elsif link.include?("github")
  #       student[:github] = link
  #     elsif link.include?("twitter")
  #       student[:twitter] = link
  #     else
  #       student[:blog] = link
  #     end
  #   end
  #   student[:profile_quote] = profile_page.css(".profile-quote").text if profile_page.css(".profile-quote")
  #   student[:bio] = profile_page.css("div.bio-content.content-holder div.description-holder p").text if profile_page.css("div.bio-content.content-holder div.description-holder p")

  #   student
  # end