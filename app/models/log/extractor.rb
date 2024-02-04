# frozen_string_literal: true

module Log
  class Extractor
    class << self
      def game_name(row)
        row.match(/gamename\\([^\\]+)/)&.captures&.first
      end

      def player_name(row)
        row.match(/n\\(.*?)\\t/)&.captures&.first
      end

      def kill_info(row)
        match_data = row.match(/Kill: \d+ \d+ \d+: (.+?) killed (.+?) by (.+)/)
        match_data&.captures || []
      end
    end
  end
end