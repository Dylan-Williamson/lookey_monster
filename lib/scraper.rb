require 'pry'
require_relative './lookey_monster'

class Scraper 
  def self.get_top_songs
    
  end
  
  def self.get_searched_song
    
  end
end










# class LookeyMonster::Scraper
  
#   @@all = []
  
#   def self.create_song_hash
#     url = "https://tunebat.com/"
#     html = HTTParty.get(url)
#     parsed_page = Nokogiri::HTML(html)
#     songs = {}
#     parsed_page.css("div.row main-row").each do |song|
#       title = song.css("div.row search-track-name").text
#       songs[title] = {
#       track: song.css('div.row search-track-name').text,
#       artist: song.css('div.row search-artist-name').text,
#       key: song.css('div.row search-attribute-value').text.scan(/\d+|\D+/)[0],
#       tempo: song.css('div.row search-attribute-value').text.scan(/\d+|\D+/)[3]
#       }
#     # binding.pry
#   end
#   songs
# end
  
#   def self.search_scraper
#     input = gets.chomp
#     url = "https://tunebat.com/Search?q="+input.gsub!(" ","+")
#     html = HTTParty.get(url)
#     parsed_page = Nokogiri::HTML(html)
#     song_listings = parsed_page.css('div.search-info-container')
#     song_listings.each do |song_listing|
#       song = {
#         track: song_listing.css('div.row.search-track-name').text,
#         artist: song_listing.css('div.row.search-artist-name').text,
#         key: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
#         tempo: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3] + " BPM"
#       }
#       @@all << song
#     end
#     # @@all.each do |song|
#     #   LookeyMonster::Song.new
#     #   # binding.pry
#     # end
#   end
  
#   def self.all
#     @@all
#   end

    
#   def self.get_top_page
#     Nokogiri::HTML(open("https://tunebat.com/"))
#   end
  
#   def self.scrape_song_index
#     get_top_page.css("div.searchResultList.row.main-row")
#   end
  
#   def self.make_top_songs
#     scrape_song_index.each do |song|
#       LookeyMonster::Song.new_from_index_page(song)
#     end
#   end
# end


# LookeyMonster::Scraper