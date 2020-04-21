require 'pry'
require_relative './lookey_monster'
require 'nokogiri'
require 'open-uri'
require 'httparty'

# name = track
# price = artist
# availability = key
# url = tempo

class LookeyMonster::Song
  attr_accessor :track, :artist, :key, :tempo

  def self.today
    # Scrape woot and meh and then return deals based on that data
    self.scrape_deals
  end

  def self.scrape_deals
    deals = []

    deals << self.scrape_woot
    deals << self.scrape_meh

    deals
  end

  def self.scrape_top_songs
    doc = Nokogiri::HTML(open("https://tunebat.com/"))

    song = self.new
    song.track = doc.search("h2.main-title").text.strip
    song.artist = doc.search("#todays-deal span.price").text.strip
    song.key = doc.search("a.wantone").first.attr("href").strip
    song.tempo =
    song.url =

    deal
  end

  def self.scrape_meh
    doc = Nokogiri::HTML(open("https://meh.com"))

    deal = self.new
    deal.name = doc.search("section.features h2").text.strip
    deal.price = doc.search("button.buy-button").text.gsub("Buy it.", "").strip
    deal.url = "https://meh.com"
    deal.availability = true

    deal
  end
end







#   attr_accessor :track, :artist, :key, :tempo, :url

#   @@all = []
#   def self.new_from_index_page(song)
#     self.new{
#       @track = song.css("div.row.search-track-name").text,
#       @artist = song.css('div.row.search-artist-name').text,
#       @key = song.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
#       @tempo = song.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3]
#     }
#   end
  
#   def initialize(track=nil, artist=nil, key=nil, tempo=nil, url=nil)
#     @track = track
#     @artist = artist 
#     @key = key 
#     @tempo = tempo
#     @url = url
#     @@all << self
#   end
  
#   def self.make_searched_song
    
#   end
  
#   def self.erase
#     @@all.clear
#   end
  
#   def self.make_top_songs
#     LookeyMonster::Scraper.scrape_song_index.each do |song|
#       LookeyMonster::Song.new_from_index_page(song)
#     end
#     @@all
#   end
  
#   # def self.
    
#   # end
 

#   def self.all
#     @@all
#   end

#   def self.find(id)
#     self.all[id-1]
#   end

#   def html
#     @html ||= Nokogiri::HTML(open(self.url))
#   end
# end















# require_relative "./lookey_monster"

# class LookeyMonster::Song
    
#     @@all = []

#     def self.all
#         @@all
#     end

#     def self.create_top_hun(song_arr)
#         song_arr.each do |song_hash|
#             new(song_hash[:track], song_hash[:artist], song_hash[:url])
#         end
#     end

#     attr_accessor :track, :artist, :url, :key, :tempo


#     def save
#         @@all << self
#     end

# end