class Frame < ActiveRecord::Base
  belongs_to :game
  has_many :balls

  def strike?
    self.balls.first.pins_koncked1 == 10
  end

  def spare?
    self.balls.pins.pins_koncke1 + self.balls.pins_koncked2 == 10
  end

end
