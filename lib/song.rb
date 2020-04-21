require 'pry'
require_relative './lookey_monster'
require 'nokogiri'
require 'open-uri'
require 'httparty'

class LookeyMonster::Song
  
  @@all = []

  attr_accessor :track, :artist, :key, :tempo, :url
  
  def initialize(song_hash)
    
  end
    
  def self.save
    @@all << self
  end

  def self.all
    @@all
  end
end

