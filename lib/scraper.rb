require 'pry'
require_relative './lookey_monster'


class LookeyMonster::Scraper
  
  def self.create_song_hash
    url = "https://tunebat.com/"
    html = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(html)
    songs = {}
    parsed_page.css("div.row main-row").each do |song|
    title = song.css("div.row search-track-name").text
    song = {
      track: song.css('div.row search-track-name').text,
      artist: song.css('div.row search-artist-name').text,
      key: song.css('div.row search-attribute-value').text.scan(/\d+|\D+/)[0],
      tempo: song.css('div.row search-attribute-value').text.scan(/\d+|\D+/)[3]
    }
    binding.pry
  end
  songs
end
  
  def search_scraper
    @@songs = []
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
      @@songs << song
    # binding.pry
    end
  end

    
  def get_top_page
    Nokogiri::HTML(open("https://tunebat.com/"))
  end
  
  def scrape_song_index
    get_top_page.css("div.searchResultList.row.main-row")
  end
  
  def make_top_songs
    scrape_song_index.each do |s|
      LookeyMonster::Song.new_from_index_page(s)
    end
  end
end


LookeyMonster::Scraper

