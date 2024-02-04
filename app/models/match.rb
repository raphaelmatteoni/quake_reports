class Match < ApplicationRecord
  include KillCountable

  has_many :kills, dependent: :destroy
  has_many :match_players
  has_many :players, through: :match_players

  def death_cause
    { kills_by_means: kills.group(:cause_of_death).count }
  end
end
