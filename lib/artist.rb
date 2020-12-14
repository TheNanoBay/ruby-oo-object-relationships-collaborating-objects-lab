
class Artist 

    attr_accessor :name
    @@all = []

    def initialize(name) 
        @name = name 
        @@all << self 
    end

    def self.all
        @@all 
    end

    def add_song(song_instance)
        song_instance.artist = self
    end

    def songs 
        Song.all.select{|i| i.artist == self}
    end

    def self.find_or_create_by_name(name)
        self.all.find{|i| i.name == name} || name = Artist.new(name)
    end

    def print_songs
        songs.each{|song| puts song.name}
    end

end