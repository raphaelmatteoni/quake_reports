# frozen_string_literal: true

json.array! @matches do |match|
  json.set! match.name.to_sym do
    json.total_kills match.total_kills
    json.players match.players.uniq.pluck(:name)
    json.kills do
      match.players.each do |player|
        json.set! player.name, player.total_kills_in_match(match)
      end
    end
  end
end
