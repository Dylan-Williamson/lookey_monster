require 'pry'
require_relative './lookey_monster'
require 'nokogiri'
require 'open-uri'
require 'httparty'

class LookeyMonster::Song
class Song

  attr_accessor :track, :artist, :key, :tempo, :url

  @@all = []

  def initialize(song_hash)
    song_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create_from_collection(songs_array)
    songs_array.each do |song_hash|
      Song.new(song_hash)
    end
  end

  def add_song_attributes(attributes_hash)
    attributes_hash.each do |attr, value|
      self.send("#{attr}=", value)
    end
    self
  end

  def self.all
    @@all
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