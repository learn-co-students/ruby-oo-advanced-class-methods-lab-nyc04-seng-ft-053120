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
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new 
    song.name = name 
    self.all << song 
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song.nil?
      song = create_by_name(name)
    end
    song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist, title = filename.gsub('.mp3', '').split(' - ')
    song = Song.new 
    song.name = title 
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    artist, title = filename.gsub('.mp3', '').split(' - ')
    song = Song.new 
    song.name = title 
    song.artist_name = artist 
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end

str = "Taylor Swift - Blank Space.mp3"
p str.gsub('.mp3', '').split(' - ')