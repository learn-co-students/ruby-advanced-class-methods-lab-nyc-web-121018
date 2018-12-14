require "pry"
class Song
  attr_accessor :artist_name, :song, :name
  @@all = []

  #instantiates and saves the song, and it returns the new song that was created
  def self.create
    title = self.new
    @@all << title
    title
  end

  # instantiates a song with a name property
  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  #instantiates and saves a song with a name property
  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  #.find_by_name can find a song present in @@all by name
  def self.find_by_name(name)
    Song.all.find do |song|
      song.name == name
    end
  end

  #method will accept a string name for a song and either
  #return a matching song instance with that name or create a
  #new song with the name
  def self.find_or_create_by_name(name)
      self.create_by_name(name) if !Song.name.include?(name)
      self.find_by_name(name)
  end

  #returns all the song instances in alphabetical order by song name
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  #initializes a song and artist_name based on the filename format
  def self.new_from_filename(name)
    song = Song.new
    title = name[0..-5]
    title = title.split(" - ")

    song = Song.new_by_name(title[1])
    song.artist_name = title[0]

    song
  end

  def self.create_from_filename(name)
    song = Song.new
    title = name[0..-5]
    title = title.split(" - ")

    song = Song.new_by_name(title[1])
    song.artist_name = title[0]

    @@all << song
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
