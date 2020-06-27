require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  # def initialize(name, artist_name)

  
  #   @name = name
  #   @artist_name = artist_name
    
  # end

  def self.all
    @@all
  end

  def save
   
    self.class.all << self
  
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
  
   song = self.new #self.new is the new instance created(With a String argument which becomes song)
   song.name = name #when we pass the new argument of name Song.new_by_name("String") anem gets stored in this variable
  song #return
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
    end

   def self.find_or_create_by_name(name)
    
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
    
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end

  def self.create_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
