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
