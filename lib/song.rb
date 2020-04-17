class Song 
  @@all = []
  
  def self.all
    @@all 
  end
  
  attr_accessor :artist, :title, :tempo, :key, :relative_minor, :lyrics
  
  def initialize(artist, title)
  end
end