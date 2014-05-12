class Player < ActiveRecord::Base
  belongs_to :game

  def running_score
    normal_score = Ball.where('player_id = ? AND pins_knocked2 IS NOT NULL', self.id).sum("pins_knocked1") +
                   Ball.where('player_id = ? AND pins_knocked2 IS NOT NULL', self.id).sum("pins_knocked2")
  end
end
