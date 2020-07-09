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
      @@all << self.new
      return @@all[-1]
  end

  def self.new_by_name(name)
      new_song = self.new 
      new_song.name = name
      new_song
  end
  def self.create_by_name(name)
    #instantiate song varible create new instance
    song = self.new 
    #access song and assign name parameter
    song.name = name
    #store the object song into the array @@all Class variable scope of entire class. 
    self.all << song
    song
  end
def self.find_by_name(name)
  @@all.find{|song|song.name == name}
  # binding.pry
end

def self.find_or_create_by_name(name)
  song = self.find_by_name(name)
  if song == nil
    song = create_by_name(name)
  end
  song 
  end
def self.alphabetical 
  self.all.sort_by{|song| song.name}
  # binding.pry
end

def self.new_from_filename(file)
 arr = file.split(" - ")
 #=>> 
 arr[1].slice!(".mp3")
  # binding.pry
 song = Song.new_by_name(arr[1])
 song.artist_name = arr[0]
 song
end

def self.create_from_filename(file)
  song = self.new_from_filename(file)
  @@all << song
end


  def self.destroy_all
      @@all = []
  end

end
