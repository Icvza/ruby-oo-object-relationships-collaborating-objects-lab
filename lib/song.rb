require'pry'
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name 
        save
    end 

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(name)
        x = name.split(" - ")
        song = self.new(x[1])
        artist = Artist.find_or_create_by_name(x[0])
        song.artist = artist
        artist.add_song(song)
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)	
        artist.add_song(self)
    end


  

    
end