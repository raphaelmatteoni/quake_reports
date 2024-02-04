class Player < ApplicationRecord
  include KillCountable

  has_many :kills, class_name: 'Kill', foreign_key: 'killer_id', dependent: :destroy
  has_many :deaths, class_name: 'Kill', foreign_key: 'victim_id', dependent: :destroy
  has_many :match_players
  has_many :matches, through: :match_players

  def total_kills_in_match(match)
    total_kills = kills.where(match: match).count
    total_kills -= deaths.by_world.where(match: match).count
    total_kills
  end
end
