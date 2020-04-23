require 'pry'
require 'httparty'
require 'nokogiri'
require 'open-uri'
require_relative './lookey_monster.rb'
require_relative './song.rb'

class LookeyMonster::Scraper

  @@songs = []
  
  
  def songs
    @@songs
  end
  
  def get_page
    @@parsed_page = Nokogiri::HTML(open(@@url))
  end

  def scrape_songs
     self.get_page.css("div.searchResultNode.col-md-8.col-md-offset-2.col-sm-8.col-sm-offset-2.col-xs-12")
  end
  
  def make_songs
    scrape_songs.each do |s|
      LookeyMonster::Song.new_from_index_page(s)
    end
  end
  
  
  def scraper
    LookeyMonster::Song.reset_all
    @@input = gets.chomp
    if @@input == "list" 
      @@url = "https://tunebat.com/Index/GetFeaturedTracks"
    elsif @@input.include?(" ") == true
      @@url = "https://tunebat.com/Search?q=" + @@input.downcase.gsub!(" ","+")
    else 
      @@url = "https://tunebat.com/Search?q=" + @@input.downcase
    end
    get_page
    song_listings = @@parsed_page.css('div.searchResultList.row.main-row')
    "https://tunebat.com/Index/GetFeaturedTracks"
    binding.pry
    
    song_listings.each do |song_listing|
      song = {
        track: song_listing.css('div.row.search-track-name').text,
        artist: song_listing.css('div.row.search-artist-name').text,
        key: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
        tempo: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3] + "BPM",
        url: song_listing.css('a["href"]').text
      }
      
      @@songs << song
      LookeyMonster::Song.song_hash << song
    end
    @@songs.clear
    LookeyMonster::Scraper.new.make_songs
  end

end



# LookeyMonster::Scraper.new.scraper

 