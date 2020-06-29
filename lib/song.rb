require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.create
    #binding.pry
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    #binding.pry
   new_song = Song.new
   new_song.name = name
   new_song
  end

  def self.create_by_name(name)
    new_song = self.create #this is calling on the create method
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.find{|song_instance| song_instance.name == name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    #binding.pry
    self.all.sort_by{|song| song.name}
  end

  # def self.new_from_filename(mp3_song) 
  #   binding.pry
  #   artist, song = mp3_song.split(" - ") 
  #   song_fixed = song.gsub(".mp3", "")
  # end


  def self.new_from_filename(filename)
    song=self.new
    song.name=filename.split(" - ")[1].split(".")[0]
    song.artist_name=filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    song=self.create
    song.name=filename.split(" - ")[1].split(".")[0]
    song.artist_name=filename.split(" - ")[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
