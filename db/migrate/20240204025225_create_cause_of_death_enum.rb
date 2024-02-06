# frozen_string_literal: true

class CreateCauseOfDeathEnum < ActiveRecord::Migration[7.0]
  def up
    create_enum :cause_of_death_enum, %w[
      MOD_UNKNOWN
      MOD_SHOTGUN
      MOD_GAUNTLET
      MOD_MACHINEGUN
      MOD_GRENADE
      MOD_GRENADE_SPLASH
      MOD_ROCKET
      MOD_ROCKET_SPLASH
      MOD_PLASMA
      MOD_PLASMA_SPLASH
      MOD_RAILGUN
      MOD_LIGHTNING
      MOD_BFG
      MOD_BFG_SPLASH
      MOD_WATER
      MOD_SLIME
      MOD_LAVA
      MOD_CRUSH
      MOD_TELEFRAG
      MOD_FALLING
      MOD_SUICIDE
      MOD_TARGET_LASER
      MOD_TRIGGER_HURT
      MOD_NAIL
      MOD_CHAINGUN
      MOD_PROXIMITY_MINE
      MOD_KAMIKAZE
      MOD_JUICED
      MOD_GRAPPLE
    ]
    add_column :kills, :cause_of_death, :enum, default: 'MOD_UNKNOWN', null: false, enum_type: 'cause_of_death_enum'
  end

  def down
    drop_enum :cause_of_death_enum
  end
end
