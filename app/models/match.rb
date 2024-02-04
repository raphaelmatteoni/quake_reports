class Match < ApplicationRecord
  include KillCountable

  has_many :kills, dependent: :destroy
  has_many :players

end
