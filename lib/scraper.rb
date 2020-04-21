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
  
  # def top_scraper
  #   url = "https://tunebat.com/"
  #   html = HTTParty.get(url)
  #   parsed_page = Nokogiri::HTML(html)
  #   song_listings = parsed_page.css('div.search-info-container')
  #   song_listings.each do |song_listing|
  #     song = {
  #       track: song_listing.css('div.row.search-track-name').text,
  #       artist: song_listing.css('div.row.search-artist-name').text,
  #       key: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
  #       tempo: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3] + " BPM",
  #     }
  #     @@songs << song
  #   binding.pry
  #   end
  # end
  
  def search_scraper
    
    input = ""
    input = gets.chomp
    if input.include?(" ") == true
      url = "https://tunebat.com/Search?q=" + input.gsub!(" ","+")
    else 
      url = "https://tunebat.com/Search?q=" + input.downcase
    end
    html = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(html)
    song_listings = parsed_page.css('div.searchResultNode')
    song_listings.each do |song_listing|
      song = {
        track: song_listing.css('div.row.search-track-name').text,
        artist: song_listing.css('div.row.search-artist-name').text,
        key: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
        tempo: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3] + " BPM",
        url: song_listing.css('a.href').text
      }
      @@songs << song
    binding.pry
    end
  end

end



LookeyMonster::Scraper.new.search_scraper

 