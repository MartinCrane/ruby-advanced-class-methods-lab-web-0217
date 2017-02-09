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
  	new_song = self.new
  	self.all << new_song
  	new_song
  end

  def self.new_by_name(name)
  	new_song = self.new
  	new_song.name = name
  	new_song
  end

  def self.create_by_name(name)
  	new_song = self.new
  	new_song.name = name
  	self.all << new_song
  	new_song
  end

  def self.find_by_name(name)
  	self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if self.all.any?{|song| song.name == name}
  		self.find_by_name(name)
  	else
  		self.create_by_name(name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by {|song| song.name[0]}
  end

  def self.new_from_filename(name)
  	new_song = self.new
  	song_format = name.split(" - ")
  	new_song.name = song_format[1][0...-4]
  	new_song.artist_name = song_format[0]
  	new_song
  end

  def self.create_from_filename(name)
  	self.all << new_from_filename(name)
  	
  end

	
	def self.destroy_all
		@@all = []
	end

	
end

# end
