require 'pry'
class Song
  attr_accessor :artist_name, :name
  @@all = []
  def initialize(name)
    @name = name
    @artist_name = artist_name
    save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    Song.new(name)
  end
  
  def self.new_by_name(song_name)
    self.new(song_name)
  end

  def self.create_by_name(name)
    self.new(name)
  end

  def self.find_by_name(name)
    self.all.each do |song_in|
      if song_in.name == name
        return song_in
      end 
    end
    nil
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
        x = self.create_by_name(name)
        return x
    else
     self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song_ins| song_ins.name}
  end

  def self.string_parser (fileName)
    file = fileName.slice(0, fileName.length-4)
    file.split(" - ")
  end 
  
  def self.new_from_filename(fileName)
      arr = self.string_parser(fileName)
      song = self.create_by_name(arr.last)
      
      song.artist_name = arr.first
      song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

  def self.destroy_all
    self.all.clear
  end
 

end
