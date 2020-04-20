require 'pry'
require_relative './lookey_monster'
require 'nokogiri'
require 'open-uri'
require 'httparty'
class LookeyMonster::Song
 
  attr_accessor :track, :artist, :key, :tempo, :url

  @@all = []
  def self.new_from_index_page(song)
    self.new(
      track: song.css("div.row.search-track-name").text,
      artist: song.css('div.row.search-artist-name').text,
      key: song.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
      tempo: song.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3]
      )
  end
  
  def initialize(track=nil, artist=nil, key=nil, tempo=nil, url=nil)
    @track = track
    @artist = artist 
    @key = key 
    @tempo = tempo
    @url = url
    @@all << self
  end


  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end






















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