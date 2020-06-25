require "pry"
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
    song=self.new
    self.all<<song
    song
  end
  def self.new_by_name(song_name)
    song=self.new()
    song.name=song_name
    song
  end
  def  self.create_by_name(song_name)
    song=self.new
    song.name=song_name
    song.save
    song
  end
  def self.find_by_name(song_name)
    self.all.find{|song| song.name==song_name}
  end
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  def self.alphabetical
    #binding.pry
    self.all.sort_by{|song| song.name}
  end
  def self.new_from_filename(filename)
    song=self.new
    #binding.pry
    artist,song_name= filename.split(" - ")
    song.name=song_name.gsub(".mp3","")
    song.artist_name=artist
    song
  end
  def self.create_from_filename(filename)
    song=self.new
    artist,song_name= filename.split(" - ")
    song.name=song_name.gsub(".mp3","")
    song.artist_name=artist
    song.save
  end
  def self.destroy_all
    self.all.clear
  end
end


