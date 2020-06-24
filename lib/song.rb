require 'pry'
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
    newsong = self.new
    newsong.save
    newsong
  end

  def self.new_by_name(name)
    newsong = self.new
    newsong.name = name
    newsong
  end

  def self.create_by_name(name)
    newsong = self.create
    newsong.name = name
    newsong
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file)
    file_array = file.split(" - ")
    file_array[1] = file_array[1].slice(0, file_array[1].length-4)
    artist = file_array[0]
    name = file_array[1]
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    file_array = file.split(" - ")
    file_array[1] = file_array[1].slice(0, file_array[1].length-4)
    artist = file_array[0]
    name = file_array[1]
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
