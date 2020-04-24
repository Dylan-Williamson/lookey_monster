require 'pry'
require_relative './lookey_monster'
require 'nokogiri'
require 'open-uri'
require 'httparty'

class LookeyMonster::Song
  
  @@songs = []
  @@all = []

  attr_accessor :track, :artist, :key, :tempo, :acousticness, :danceability, :energy, :instrumentalness, :liveness, :loudness, :speechiness, :time_signature
  
  def initialize(track=nil, artist=nil, key=nil, tempo=nil, acousticness=nil, danceability=nil, energy=nil, instrumentalness=nil, liveness=nil, loudness=nil, speechiness=nil, time_signature=nil)
    
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
    # self.track = track if track
    # self.artist = artist if artist
    # self.key = key if key
    # self.tempo = tempo if tempo
    # self.acousticness = acousticness if acousticness
    # self.danceability = danceability if danceability
    # self.energy = energy if energy
    # self.instrumentalness = instrumentalness if instrumentalness
    # self.liveness = liveness if liveness
    # self.loudness = loudness if loudness
    # self.speechiness = speechiness if speechiness
    # self.time_signature = time_signature if time_signature
    @@all << self
  end
  
  def self.mass_create_from_api(song_array)
    song_array.each do |hsh|
      new(hsh["Name"], hsh["ArtistName"], hsh["Key"], hsh["BPM"], hsh["Acousticness"], hsh["Danceability"], hsh["Energy"], hsh["Instrumentalness"], hsh["Liveness"], hsh["Loudness"], hsh["Speechiness"], hsh["TimeSignature"])
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
  
  def self.find(id)
    self.all[id-1]
  end
  
  def self.save
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

