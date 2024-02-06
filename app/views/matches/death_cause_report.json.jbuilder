# frozen_string_literal: true

json.array! @matches do |match|
  json.set! match.name, match.kills_by_means
end
