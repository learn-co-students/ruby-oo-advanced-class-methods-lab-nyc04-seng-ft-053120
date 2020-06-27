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
    i = Song.new
    i.save
    i
  end

  def self.new_by_name(name)
    i = Song.new
    i.name = name
    i
  end

  def self.create_by_name(name)
    i = Song.new
    i.name = name
    i.save
    i
  end

  def self.find_by_name(name)
    self.all.find { |i| i.name == name }
    # binding.pry
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |i| i.name}
  end

  def self.new_from_filename(file_name)
    i = Song.new
    i.name = file_name.delete_suffix!(".mp3").split(" - ")[1]
    i.artist_name = file_name.split(" - ")[0]
    i
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

  def self.destroy_all
    self.all.clear
  end

end
