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
        if row.include?('InitGame')
          create_match
        elsif row.include?('ClientUserinfoChanged')
          create_player
        elsif row.include?('Kill')
          create_kill
        end
      end
    end

    private

    def create_match
      @match = Match.create(name: Extractor.game_name(@row))
    end

    def create_player
      player_name = Extractor.player_name(@row)
      player = Player.find_or_create_by(name: player_name)

      @match.players << player if @match
    end

    def create_kill
      killer_name, victim_name, cause_of_death = Extractor.kill_info(@row)
      killer = killer_name != '<world>' ? Player.find_by(name: killer_name) : nil
      victim = Player.find_by(name: victim_name)

      Kill.create(
        match: @match,
        killer:,
        victim:,
        cause_of_death:
      )
    end
  end
end
