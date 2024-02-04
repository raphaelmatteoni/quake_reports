# frozen_string_literal: true

module Log
  class Parser
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def call
      @file.each do |row|
        @row = row
        case
        when row.include?("InitGame")
          create_match
        when row.include?("ClientUserinfoChanged")
          create_player
        end
      end
    end

    private

    def create_match
      Match.create(name: game_name)
    end

    def create_player
      Player.find_or_create_by(name: player_name)
    end

    def game_name
      @row.match(/gamename\\([^\\]+)/)&.captures&.first
    end

    def player_name
      @row.match(/n\\(.*?)\\t/)&.captures&.first
    end
  end
end
