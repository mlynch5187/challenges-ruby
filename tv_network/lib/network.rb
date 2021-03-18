class Network
  attr_reader :name, :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    @shows.map {|show| show.characters}.flatten
  end

  def actors_by_show
    show_actors = {}
    @shows.each do |show|
      show_actors[show] = show.actors
    end
    show_actors
  end
end
