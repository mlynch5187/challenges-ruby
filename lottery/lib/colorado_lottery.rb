class ColoradoLottery
  attr_reader :winners, :registered_contestants, :current_contestants
  def initialize()
    @winners = []
    @registered_contestants = {}
    @current_contestants = {}
  end
end
