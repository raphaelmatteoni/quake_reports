# frozen_string_literal: true

module Log
  class Parser
    attr_reader :file

    def initialize(file)
      @file = file
      @match = nil
    end

    def call
      @file.each do |row|
        @row = row
        case
        when row.include?("InitGame")
          create_match
        when row.include?("ClientUserinfoChanged")
          create_player
        when row.include?("Kill")
          create_kill
        end
      end
    end

    private

    def create_match
      @match = Match.create(name: game_name)
    end

    def create_player
      Player.find_or_create_by(name: player_name)
    end

    def create_kill
      killer_name, victim_name, cause_of_death = extract_kill_info
      killer = killer_name != "<world>" ? Player.find_by(name: killer_name) : nil
      victim = Player.find_by(name: victim_name)

      Kill.create(
        match: @match,
        killer: killer,
        victim: victim,
        cause_of_death: cause_of_death
      )
    end

    def game_name
      @row.match(/gamename\\([^\\]+)/)&.captures&.first
    end

    def player_name
      @row.match(/n\\(.*?)\\t/)&.captures&.first
    end

    def extract_kill_info
      match_data = @row.match(/Kill: \d+ \d+ \d+: (.+?) killed (.+?) by (.+)/)
      [match_data[1], match_data[2], match_data[3]]
    end
  end
end
