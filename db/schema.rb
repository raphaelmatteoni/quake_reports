# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_04_025225) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "cause_of_death_enum", ["MOD_UNKNOWN", "MOD_SHOTGUN", "MOD_GAUNTLET", "MOD_MACHINEGUN", "MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_ROCKET", "MOD_ROCKET_SPLASH", "MOD_PLASMA", "MOD_PLASMA_SPLASH", "MOD_RAILGUN", "MOD_LIGHTNING", "MOD_BFG", "MOD_BFG_SPLASH", "MOD_WATER", "MOD_SLIME", "MOD_LAVA", "MOD_CRUSH", "MOD_TELEFRAG", "MOD_FALLING", "MOD_SUICIDE", "MOD_TARGET_LASER", "MOD_TRIGGER_HURT", "MOD_NAIL", "MOD_CHAINGUN", "MOD_PROXIMITY_MINE", "MOD_KAMIKAZE", "MOD_JUICED", "MOD_GRAPPLE"]

  create_table "kills", force: :cascade do |t|
    t.bigint "killer_id"
    t.bigint "victim_id"
    t.bigint "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.enum "cause_of_death", default: "MOD_UNKNOWN", null: false, enum_type: "cause_of_death_enum"
    t.index ["killer_id"], name: "index_kills_on_killer_id"
    t.index ["match_id"], name: "index_kills_on_match_id"
    t.index ["victim_id"], name: "index_kills_on_victim_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "kills", "matches"
  add_foreign_key "kills", "players", column: "killer_id"
  add_foreign_key "kills", "players", column: "victim_id"
end
