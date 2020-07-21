class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(string_song_name)
    song = self.new
    song.name = string_song_name
    song
      end

      def self.create_by_name(string_song_name)
        song = self.new
        song.name = string_song_name
        song.save
        song
          end

          def self.find_by_name(string_song_name)
            @@all.find do|song|
              song.name == string_song_name
              end

end
def self.find_or_create_by_name(song_name)
self.find_by_name(song_name) || self.create_by_name(song_name)
end


def self.alphabetical
  @@all.sort_by!{|song|song.name}
end

def self.new_from_filename(file_name)
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    new_song
  end

  def self.create_from_filename(file_name)
      new_song = self.new
      new_song.name = file_name.split(" - ")[1].split(".")[0]
      new_song.artist_name = file_name.split(" - ")[0]
      @@all << new_song
    end

    def self.destroy_all
      @@all = []
    end





  def self.all
    @@all
  end

  def save
    self.class.all << self
  end



end
