class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    self.all << song
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    name_and_artist = filename.split(" - ")
    song = Song.new_by_name(name_and_artist[1].chomp(".mp3"))
    song.artist_name = (name_and_artist[0])
    song
  end

  def self.create_from_filename(filename)
    name_and_artist = filename.split(" - ")
    song = Song.create_by_name(name_and_artist[1].chomp(".mp3"))
    song.artist_name = (name_and_artist[0])
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
