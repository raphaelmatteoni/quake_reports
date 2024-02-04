module KillCountable
  extend ActiveSupport::Concern

  def total_kills
    total_kills = kills.count
    total_kills -= deaths_relation.by_world.count
    total_kills
  end

  def deaths_relation
    respond_to?(:deaths) ? deaths : kills
  end
end
