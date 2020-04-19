require 'pry'
require 'httparty'
require 'nokogiri'
require_relative './lookey_monster'

class LookeyMonster::Scraper
  def song_scraper
    input = input.to_s
    input = gets.chomp
    url = "https://tunebat.com/Search?q=" + input.gsub!(" ","+").to_s
    html = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(html)
    songs = []
    song_listings = parsed_page.css('div.search-info-container')
    song_listings.each do |song_listing|
      song = {
        track: song_listing.css('div.row.search-track-name').text.scan(/\d+|\D+/),
        artist: song_listing.css('div.row.search-artist-name').text.scan(/\d+|\D+/),
        key: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
        tempo: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3] + " BPM"
      }
      songs << song
    binding.pry
    end
    song_scraper
  end
end
