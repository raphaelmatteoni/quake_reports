json.array! @matches do |match|
  json.set! match.name, match.death_cause
end