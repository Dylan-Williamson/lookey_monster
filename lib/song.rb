require 'pry'
require_relative './lookey_monster'
require 'nokogiri'
require 'open-uri'
require 'httparty'

class LookeyMonster::Song
  
  @@all = []

  attr_accessor :track, :artist, :key, :tempo, :url
  
  def initialize(track=nil, artist=nil, key=nil, tempo=nil, url=nil)
    @track = track
    @artist = artist
    @key = key 
    @tempo = tempo
    @url = url
    @@all << self
  end
  
  def self.new_from_index_page(s)
    self.new(
    s.css('div.row.search-track-name').text,
    s.css('div.row.search-artist-name').text,
    s.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
    s.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3] + " BPM",
    )
  end
  def self.save
    @@all << self
  end

  def self.all
    @@all
  end
  
  def self.reset_all
    @@all.clear
  end
end

