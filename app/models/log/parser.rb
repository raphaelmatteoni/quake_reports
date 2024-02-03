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
        if row.include?("InitGame")
          Match.create(name: game_name)
        end
      end
    end

    private

    def game_name
      @row.match(/gamename\\([^\\]+)/)&.captures&.first
    end
  end
end
