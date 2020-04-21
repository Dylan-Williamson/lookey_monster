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
  
  # def initialize
  #   @@input = gets.chomp
  #   @@input = input
  # end

  # def determine_url
  #   if @@input == "100" 
  #     @@url = "https://tunebat.com/"
  #   elsif @@input.include?(" ") == true
  #     @@url = "https://tunebat.com/Search?q=" + @@input.downcase.gsub!(" ","+")
  #   else 
  #     @@url = "https://tunebat.com/Search?q=" + @@input.downcase
  #   end
  # end
  
  def get_page
    @@parsed_page = Nokogiri::HTML(open(@@url))
  end

  def scrape_songs
     self.get_page.css("div.search-info-container")
  end
  
  def make_songs
    scrape_songs.each do |s|
      LookeyMonster::Song.new_from_index_page(s)
    end
  end
  
  
  def scraper
    @@input = gets.chomp
    if @@input == "list" 
      @@url = "https://tunebat.com/"
    elsif @@input.include?(" ") == true
      @@url = "https://tunebat.com/Search?q=" + @@input.downcase.gsub!(" ","+")
    else 
      @@url = "https://tunebat.com/Search?q=" + @@input.downcase
    end
    get_page
    # html = HTTParty.get(url)
    # parsed_page = Nokogiri::HTML(html)
    song_listings = @@parsed_page.css('div.search-info-container')
    song_listings.each do |song_listing|
      song = {
        track: song_listing.css('div.row.search-track-name').text,
        artist: song_listing.css('div.row.search-artist-name').text,
        key: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
        tempo: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3] + " BPM",
        # url: song_listing.css('a.href').text
      }
      @@songs << song
      LookeyMonster::Song.song_hash << song
    # binding.pry
    end
    @@songs.clear
    LookeyMonster::Scraper.new.make_songs
  end

end



# LookeyMonster::Scraper.new.scraper

 