require_relative "./lookey_monster"

class LookeyMonster::Song
    
    @@all = []

    def self.all
        @@all
    end

    def self.create_top_hun(song_arr)
        song_arr.each do |song_hash|
            new(song_hash[:track], song_hash[:artist], song_hash[:url])
        end
    end

    attr_accessor :track, :artist, :url, :key, :tempo

    def initialize(track, artist, url)
        @track = track
        @artist = artist 
        @url = url
        @key = nil 
        @tempo = nil
        save
    end

    def save
        @@all << self
    end

end