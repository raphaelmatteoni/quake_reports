# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  fixtures :all

  describe '#total_kills' do
    it 'calculates total kills for a player' do
      player = players(:player1)

      expect(player.total_kills).to eq(1)
    end
  end

  describe '#total_kills_in_match' do
    it 'calculates total kills for a player in a specific match' do
      player = players(:player1)
      match = matches(:match1)

      expect(player.total_kills_in_match(match)).to eq(1)
    end
  end
end
