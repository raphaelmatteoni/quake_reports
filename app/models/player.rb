class Player < ApplicationRecord
  has_many :kills, class_name: 'Kill', foreign_key: 'killer_id'
  has_many :deaths, class_name: 'Kill', foreign_key: 'victim_id'
  has_many :matches, through: :kills
end
