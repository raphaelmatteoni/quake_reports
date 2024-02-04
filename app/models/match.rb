class Match < ApplicationRecord
  include KillCountable

  has_many :kills, dependent: :destroy
  has_many :match_players
  has_many :players, through: :match_players
end
