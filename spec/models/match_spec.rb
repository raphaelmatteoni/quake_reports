# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  fixtures :all

  describe '#total_kills' do
    it 'calculates total kills in a match' do
      players(:player1)
      match = matches(:match1)

      expect(match.total_kills).to eq(2)
    end
  end
end
