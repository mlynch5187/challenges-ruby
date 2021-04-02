class Curator
  attr_reader :photographs, :artists
  def initialize()
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find {|artist| artist.id === id}
  end

  def photographs_by_artist
    artist_photos = {}
    @artists.each do |artist|
      artist_photos[artist] = []
      @photographs.find_all do |photo|
        if photo.artist_id === artist.id
          artist_photos[artist] << photo
        end
      end
    end
    artist_photos
  end

  def artists_with_multiple_photographs
    artist_list = []
    multiple_photos = []
    counts = Hash.new(0)
    photographs_by_artist.keys.each do |artist|
    photographs.each do |photo|
      if artist.id === photo.artist_id
        artist_list << artist.name
        end
      end
    end
    artist_list.tally.each_with_index do |(key, value), index|
      if value > 1
        multiple_photos << key
      end
    end
    multiple_photos
  end

  def photographs_taken_by_artist_from(country)
    photos_by_country = []
    photographs_by_artist.each_with_index do |(key, value), index|
      if key.country === country
        photos_by_country << value
      end
    end
    photos_by_country.flatten
  end
end
