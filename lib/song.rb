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
    #instantiat itself && save
    @@all << self.new
    #returns the last saved song
    return @@all[-1]
  end

  def self.new_by_name(name)
    #instantiate a new song
    variable = self.new 
    #assign the parameter name to the variable(of Song class)
    variable.name = name
    variable
  end

  def self.create_by_name(name)
    #instantiate itself(is of class Song) and store that into song 
    song = self.new
    #access song attribute "name" and assign the parameter
    song.name = name
    #Store the object song into the array @@all[]
    self.all << song
    #returning object
    song
  end

  def self.find_by_name(name)
    @@all.find{|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    #
    song = self.find_by_name(name)
    if song == nil
      song = create_by_name(name)
    end
    song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    arr = file.split(" - ")
    arr[1].slice!(".mp3")

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
