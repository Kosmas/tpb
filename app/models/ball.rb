class Ball < ActiveRecord::Base
  belongs_to :frame
  belongs_to :player

  def first_ball
    pins_kncked = rand(0..10)
  end

  def second_ball(pins_knocked1)
    remaining_pins = 10 - pins_knocked1
    pins_kncked = rand(0.. remaining_pins)
  end

  def strike?
    self.first_ball == 10
  end

  def spare?
    self.first_ball + self.second_ball == 10
  end

  def score_update
    player  = self.player_id
    game    = self.frame.game_id
    points  = self.pins_knocked1 + self.pins_knocked2 unless self.pins_knocked2.nil?

    score = Score.create_with(total: points).find_or_create_by(player_id: player, game_id: game)
  end
end
