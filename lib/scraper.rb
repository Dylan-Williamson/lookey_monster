require 'pry'
require 'httparty'
require 'nokogiri'
require 'open-uri'
require_relative './lookey_monster.rb'
require_relative './song.rb'

class LookeyMonster::Scraper
  
  def songs
    @@songs
  end
  
  def initialize
    @@songs = []
  end
  
  def get_page
    Nokogiri::HTML(open(url))
  end

  def scrape_restaurants_index
     self.get_page.css("div[data-list='1-50'] a.item")
  end
  
  def determine_url
    if input == "100" 
      url = "https://tunebat.com/"
    elsif input.include?(" ") == true
      url = "https://tunebat.com/Search?q=" + input.downcase.gsub!(" ","+")
    else 
      url = "https://tunebat.com/Search?q=" + input.downcase
    end
  end
  
  def scraper
    
    input = ""
    input = gets.chomp
    determine_url
    html = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(html)
    song_listings = parsed_page.css('div.search-info-container')
    song_listings.each do |song_listing|
      song = {
        track: song_listing.css('div.row.search-track-name').text,
        artist: song_listing.css('div.row.search-artist-name').text,
        key: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
        tempo: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3] + " BPM",
        # url: song_listing.css('a.href').text
      }
      @@songs << song
      LookeyMonster::Song.all << song
    binding.pry
    end
  end

end



# LookeyMonster::Scraper.new.scraper

 