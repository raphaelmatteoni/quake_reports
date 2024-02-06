# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Log::Parser do
  subject { described_class.new(file) }
  let(:file) { File.open('spec/fixtures/qgames.log') }

  describe '#call' do
    before { subject.call }

    it 'parse and return the number of matches found' do
      expect(Match.count).to eq(2)
    end

    it 'parse and return the number of players found' do
      expect(Player.count).to eq(3)
    end

    it 'parse and return the number of kills found' do
      expect(Kill.count).to eq(11)
    end
  end
end
