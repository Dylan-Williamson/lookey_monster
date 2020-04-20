require 'pry'
require 'httparty'
require 'nokogiri'
require_relative './lookey_monster'

def scraper
  @@songs = []
  input = ""
  input = gets.chomp
  url = "https://tunebat.com/Search?q=" + input.gsub!(" ","+")
  html = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(html)
  song_listings = parsed_page.css('div.search-info-container')
  song_listings.each do |song_listing|
    song = {
      track: song_listing.css('div.row.search-track-name').text,
      artist: song_listing.css('div.row.search-artist-name').text,
      key: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
      tempo: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3] + " BPM",
    }
    @@songs << song
  binding.pry
  end
end
scraper








class LookeyMonster::Scraper

    
  def self.get_top_hun
    url = "https://www.tunebat.com/"
    doc = Nokogiri::HTML(open(url))
    tracks = doc.css("div.row.search-track-name")
    
    s_array = []

    LookeyMonster::Song.create_top_hun(song_arr)
    
  end
    
    def self.get_info(song_obj)
        url = song_object.url
        doc = Nokogiri::HTML(open(url))
        info = doc.css(".table.table-striped.wanted-person-description tbody").text
        puts info 
    end
end


LookeyMonster::Scraper

