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
    song = Song.new
    @@all << song
    song
  end

  def Song.new_by_name(song)
    new_song = self.create
    new_song.name = song
    new_song
  end

  def Song.create_by_name(title)
    new_song = Song.new_by_name(title)
    @@all << new_song
    new_song
  end

  def Song.find_by_name(title)
    self.all.find{ |song| song.name == title}
  end

  def Song.find_or_create_by_name(title)
    if Song.find_by_name(title)
      Song.find_by_name(title)
    else
      Song.create_by_name(title)
    end
  end

  def Song.alphabetical
    self.all.uniq.sort_by{ |song| song.name }
  end

  def Song.new_from_filename(filename)
    arr = filename.split(" - ")
    arr[1].slice!(".mp3")

    new_song = Song.new_by_name(arr[1])
    new_song.artist_name = arr[0]

    new_song
  end

  def Song.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)

    @@all << new_song

  end

  def Song.destroy_all
    self.all.clear
  end

end
