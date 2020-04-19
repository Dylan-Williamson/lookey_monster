class LookeyMonster::Artist 
  @@all = []
  
  def self.all
    @@all 
  end
  
  attr_accessor :name
  attr_reader :songs
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def save
    @@all << self
  end
end