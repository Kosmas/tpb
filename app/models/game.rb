class Game < ActiveRecord::Base
  has_many :players
  has_many :frames
end
