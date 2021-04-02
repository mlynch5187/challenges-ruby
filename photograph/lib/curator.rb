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
end
