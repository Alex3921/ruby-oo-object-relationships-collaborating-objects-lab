class Song
    attr_accessor :artist, :name
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

    def self.new_by_filename(file_name)
        song_artist = file_name.split(" - ")
        song_artist[1] = Song.new(song_artist[1])
        song_artist[1].artist = Artist.find_or_create_by_name(song_artist[0])
        song_artist[1]
    end

    def artist_name=(name)
        name = Artist.find_or_create_by_name(name)
        name.add_song(self)
    end    


end

