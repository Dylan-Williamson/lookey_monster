class LookeyMonster::Song
  @@all = []
  
  def self.all
    @@all 
  end
  
  attr_accessor :track, :artist, :key, :tempo
  
  def initialize(artist, title)
  end
end