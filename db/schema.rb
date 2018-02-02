# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180202130902) do

  create_table "avatars", force: :cascade do |t|
    t.string "name", null: false
    t.integer "hp", default: 20
    t.integer "level", default: 1
    t.integer "exp", default: 0
    t.integer "countUnlockDonjon", default: 1
    t.integer "history", default: 0
    t.integer "MaxHealth", default: 20
    t.integer "force", default: 5
    t.integer "agility", default: 5
    t.integer "inteligence", default: 5
    t.integer "id_sword"
    t.integer "gold", default: 0
    t.integer "id_shield"
    t.integer "id_armor"
    t.integer "nextLevel", default: 50
    t.integer "job_id"
    t.integer "user_id"
    t.integer "inventory_id"
    t.integer "defence"
    t.index ["inventory_id"], name: "index_avatars_on_inventory_id"
    t.index ["job_id"], name: "index_avatars_on_job_id"
    t.index ["user_id"], name: "index_avatars_on_user_id"
  end

  create_table "chest_in_rooms", force: :cascade do |t|
    t.integer "room_id"
    t.integer "chest_id"
    t.index ["chest_id"], name: "index_chest_in_rooms_on_chest_id"
    t.index ["room_id"], name: "index_chest_in_rooms_on_room_id"
  end

  create_table "chests", force: :cascade do |t|
    t.integer "gold"
  end

  create_table "donjons", force: :cascade do |t|
    t.string "name"
    t.integer "level"
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "item_id"
    t.integer "recipe_id"
    t.index ["item_id"], name: "index_ingredients_on_item_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "avatar_id"
    t.integer "monster_id"
    t.index ["avatar_id"], name: "index_inventories_on_avatar_id"
    t.index ["monster_id"], name: "index_inventories_on_monster_id"
  end

  create_table "item_in_chests", force: :cascade do |t|
    t.integer "chest_id"
    t.integer "item_id"
    t.index ["item_id"], name: "index_item_in_chests_on_item_id"
    t.index [nil], name: "index_item_in_chests_on_room_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "rarity", default: 0
    t.integer "health", default: 0
    t.integer "force", default: 0
    t.integer "agility", default: 0
    t.integer "price", default: 0
    t.integer "defence", default: 0
    t.string "category"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
  end

  create_table "monster_in_rooms", force: :cascade do |t|
    t.integer "room_id"
    t.integer "monster_id"
    t.index ["monster_id"], name: "index_monster_in_rooms_on_monster_id"
    t.index ["room_id"], name: "index_monster_in_rooms_on_room_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "strong"
    t.integer "agility"
    t.integer "exp"
    t.integer "defence"
    t.integer "gold"
    t.integer "inventory_id"
    t.index ["inventory_id"], name: "index_monsters_on_inventory_id"
  end

  create_table "pockets", force: :cascade do |t|
    t.integer "inventory_id"
    t.integer "item_id"
    t.index ["inventory_id"], name: "index_pockets_on_inventory_id"
    t.index ["item_id"], name: "index_pockets_on_item_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "item_id"
    t.index ["item_id"], name: "index_recipes_on_item_id"
  end

  create_table "room_in_donjons", force: :cascade do |t|
    t.integer "room_id"
    t.integer "donjon_id"
    t.index ["donjon_id"], name: "index_room_in_donjons_on_donjon_id"
    t.index ["room_id"], name: "index_room_in_donjons_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.integer "avatar_id"
    t.index ["avatar_id"], name: "index_users_on_avatar_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
