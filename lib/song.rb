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
    s = self.new
    @@all << s
    return s
    
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song 
    return song 
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song 
    return song 
  end 
  
  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
    
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end 
    
  def self.new_from_filename(name)
    arr1 = name.split("-")
    arr2 = arr1[1].split(".")
    
    song = self.new
    song.name = arr2[0].strip
    song.artist_name = arr1[0].strip
    @@all << song 
    return song 
  end 
  
  def self.create_from_filename(name)
    arr1 = name.split("-")
    arr2 = arr1[1].split(".")
    
    song = self.new
    song.name = arr2[0].strip
    song.artist_name = arr1[0].strip
    @@all << song 
    return song
    
  end 
  
  def self.destroy_all
    @@all = []
  end 
      

end
