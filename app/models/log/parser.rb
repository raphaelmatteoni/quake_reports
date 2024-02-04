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
        when row.include?("InitGame") then create_match
        when row.include?("ClientUserinfoChanged") then create_player
        when row.include?("Kill") then create_kill
        end
      end
    end

    private

    def create_match
      @match = Match.create(name: Extractor.game_name(@row))
    end

    def create_player
      Player.find_or_create_by(name: Extractor.player_name(@row))
    end

    def create_kill
      killer_name, victim_name, cause_of_death = Extractor.kill_info(@row)
      killer = killer_name != "<world>" ? Player.find_by(name: killer_name) : nil
      victim = Player.find_by(name: victim_name)

      Kill.create(
        match: @match,
        killer: killer,
        victim: victim,
        cause_of_death: cause_of_death
      )
    end
  end
end
