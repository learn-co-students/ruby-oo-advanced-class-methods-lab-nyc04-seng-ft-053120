require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = [] # class var that stores all instances for Song created through instance method Song#save

  # class getter for @@all, which returns an array of all instances of Song
  def self.all
    @@all
  end

  # instance method that pushes the instance into class variable @@all, by calling class method self.all
  def save
    self.class.all << self
    # self.class would return Song
    # Song.all is a class method that returns @@all
    # equivalent to @@all << self
  end

  # class constructor that initializes a song and saves it to the @@all class var (literally or through Song.all class method), return the new song instance created
  def self.create
    song = Song.new 
    song.save
    song
  end

  # class constructor that takes a string name of song, returns a song instance with that name set as its name property
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  # class constructor that takes in string name of a song and returns song instance with that name set as its name property, and song being saved into @@all class var
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  # class method that accepts a string name of a song and returns the matching instance of the song with that name
  def self.find_by_name(name)
    # loop through all song instances in @@all (which is accessed through self.all class method), use .find to return the song instance where name is the same as the name passed in
    self.all.find { |song_instance| song_instance.name == name }
  end

  # class method that accepts a string name for a song and either return a matching song instance with that name or create a new song with the name and return the song instance
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  # class method that returns all the songs in ascending (a-z) alphabetical order using Array#sort_by
  def self.alphabetical
    self.all.sort_by { |song_instance| song_instance.name }
  end

  # class constructor that accepts a filename in the format of "-.mp3" (for ex: "Taylor Swift - Blank Space.mp3"), returns a new Song instance with the song name set to title and artist name set to artist name
  def self.new_from_filename(filename)
    filename = filename.split(' - ')
    artist_name = filename[0]
    song_name = filename[1][0...-4]

    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  # class constructor that accepts a filename in the format of "-.mp3", should not only parse the filename correctly but also save the Song instance that was created
  def self.create_from_filename(filename)
    filename = filename.split(' - ')
    artist_name = filename[0]
    song_name = filename[1][0...-4]

    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  # class method that returns the state of @@all class var to an empty array thereby deleting all previous song instances
  def self.destroy_all
    self.all.clear
  end
end
