# require 'pry'
# require_relative './lookey_monster'
# require 'nokogiri'
# require 'open-uri'
# require 'httparty'
require_relative './lookey_monster.rb'

class LookeyMonster::Song
  
  @@songs = []
  @@all = []

  attr_accessor :track, :artist, :key, :tempo, :acousticness, :danceability, :energy, :instrumentalness, :liveness, :loudness, :speechiness, :time_signature
  
  def initialize(track, artist, key, tempo, acousticness = nil, danceability = nil, energy = nil, instrumentalness = nil, liveness = nil, loudness = nil, speechiness = nil, time_signature = nil)
    
    @track = track
    @artist = artist
    @key = key 
    @tempo = tempo
    @acousticness = acousticness
    @danceability = danceability
    @energy = energy
    @instrumentalness = instrumentalness
    @liveness = liveness
    @loudness = loudness
    @speechiness = speechiness
    @time_signature = time_signature
    save
  end
  
  def self.mass_create_from_api(song_array)
    song_array.each do |hsh|
      new(
        hsh["Name"],
        hsh["ArtistName"],
        hsh["Key"],
        hsh["BPM"],
        hsh["Acousticness"],
        hsh["Danceability"],
        hsh["Energy"],
        hsh["Instrumentalness"],
        hsh["Liveness"],
        hsh["Loudness"],
        hsh["Speechiness"],
        hsh["TimeSignature"]
        )
    end
  end
  
  def self.new_from_index_page(s)
    self.new(
    s.css('div.row.search-track-name').text,
    s.css('div.row.search-artist-name').text,
    s.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
    s.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3] + " BPM",
    s.css('a.href').text
    )
  end
  
  def save
    @@all << self
  end
  
  def self.song_hash
    @@songs
  end

  def self.all
    @@all
  end
  
  def self.reset_all
    @@all.clear
  end
    
end

