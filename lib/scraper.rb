require 'pry'
require 'httparty'
require 'nokogiri'

require_relative './lookey_monster'
def scraper
  url = "https://tunebat.com/Search?q=hi"
  html = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(html)
  song_listings = parsed_page.css('div.search-info-container')
  song_listings.each do |song_listing|
    song = {
      track: song_listing.css('div.row.search-track-name').text
      artist: song_listing.css('div.row.search-artist-name').text
      key: song_listing.css('div.row.search-attribute-value').first.text
      tempo: song_listing.css('div.row.search-attribute-value')[1].text
    }
  binding.pry 
end

scraper