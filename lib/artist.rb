require 'pry'

class Artist
    attr_accessor :name
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

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        if Artist.all.empty?
            new_instance = Artist.new(name)
        else            
            artist_instance = Artist.all.find{|instance| instance.name == name}
            if artist_instance.name == name
                artist_instance
            else
                new_instance = Artist.new(name)
            end
        end
    end

    def print_songs
        self.songs.each{|song| puts song.name}
    end

end
