class Match < ApplicationRecord
  has_many :kills
  has_many :players
end
