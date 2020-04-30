# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_30_165315) do

  create_table "area_prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "price", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "time"
    t.string "area_name"
    t.index ["area_name"], name: "index_area_prices_on_area_name"
    t.index ["time"], name: "index_area_prices_on_time"
  end

  create_table "city_prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "price", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "time"
    t.index ["time"], name: "index_city_prices_on_time"
  end

  create_table "houses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "v_id"
    t.string "area"
    t.string "feature"
    t.string "title"
    t.string "xiaoqu_"
    t.string "room"
    t.decimal "total_price", precision: 10
    t.string "price"
    t.string "louceng"
    t.string "louxing"
    t.string "chaoxiang"
    t.string "zhuangxiu"
    t.string "age"
    t.string "quyu"
    t.string "shoufu"
    t.string "xiaoqu"
    t.bigint "village_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["age"], name: "index_houses_on_age"
    t.index ["area"], name: "index_houses_on_area"
    t.index ["chaoxiang"], name: "index_houses_on_chaoxiang"
    t.index ["feature"], name: "index_houses_on_feature"
    t.index ["louceng"], name: "index_houses_on_louceng"
    t.index ["louxing"], name: "index_houses_on_louxing"
    t.index ["price"], name: "index_houses_on_price"
    t.index ["quyu"], name: "index_houses_on_quyu"
    t.index ["room"], name: "index_houses_on_room"
    t.index ["shoufu"], name: "index_houses_on_shoufu"
    t.index ["title"], name: "index_houses_on_title"
    t.index ["total_price"], name: "index_houses_on_total_price"
    t.index ["v_id"], name: "index_houses_on_v_id"
    t.index ["village_id"], name: "index_houses_on_village_id"
    t.index ["xiaoqu"], name: "index_houses_on_xiaoqu"
    t.index ["xiaoqu_"], name: "index_houses_on_xiaoqu_"
    t.index ["zhuangxiu"], name: "index_houses_on_zhuangxiu"
  end

  create_table "positions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "x"
    t.string "y"
    t.string "v_id"
    t.string "address"
    t.string "city"
    t.bigint "village_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address"], name: "index_positions_on_address"
    t.index ["city"], name: "index_positions_on_city"
    t.index ["v_id"], name: "index_positions_on_v_id"
    t.index ["village_id"], name: "index_positions_on_village_id"
    t.index ["x"], name: "index_positions_on_x"
    t.index ["y"], name: "index_positions_on_y"
  end

  create_table "properties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "tit"
    t.string "jl"
    t.string "desc"
    t.bigint "village_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type_id"
    t.index ["desc"], name: "index_properties_on_desc"
    t.index ["jl"], name: "index_properties_on_jl"
    t.index ["tit"], name: "index_properties_on_tit"
    t.index ["type_id"], name: "index_properties_on_type_id"
    t.index ["village_id"], name: "index_properties_on_village_id"
  end

  create_table "proxy_pools", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ip"
    t.string "protocol"
    t.integer "port"
    t.integer "active"
    t.string "source"
    t.integer "check_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fail_count"
    t.bigint "long_time"
    t.index ["active"], name: "index_proxy_pools_on_active"
    t.index ["check_count"], name: "index_proxy_pools_on_check_count"
    t.index ["fail_count"], name: "index_proxy_pools_on_fail_count"
    t.index ["ip"], name: "index_proxy_pools_on_ip"
    t.index ["long_time"], name: "index_proxy_pools_on_long_time"
    t.index ["port"], name: "index_proxy_pools_on_port"
    t.index ["protocol"], name: "index_proxy_pools_on_protocol"
    t.index ["source"], name: "index_proxy_pools_on_source"
  end

  create_table "village_prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "price", precision: 10
    t.string "v_id"
    t.bigint "village_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "time"
    t.index ["price"], name: "index_village_prices_on_price"
    t.index ["time"], name: "index_village_prices_on_time"
    t.index ["v_id"], name: "index_village_prices_on_v_id"
    t.index ["village_id"], name: "index_village_prices_on_village_id"
  end

  create_table "villages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "district"
    t.string "comarea"
    t.decimal "ave_price", precision: 10
    t.integer "age"
    t.string "type_id"
    t.string "count_id"
    t.integer "building_count"
    t.string "lh"
    t.string "rj"
    t.string "desc"
    t.string "building_type"
    t.string "wy_price"
    t.string "wy"
    t.string "tcw"
    t.string "company"
    t.string "v_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["age"], name: "index_villages_on_age"
    t.index ["ave_price"], name: "index_villages_on_ave_price"
    t.index ["building_count"], name: "index_villages_on_building_count"
    t.index ["building_type"], name: "index_villages_on_building_type"
    t.index ["comarea"], name: "index_villages_on_comarea"
    t.index ["company"], name: "index_villages_on_company"
    t.index ["count_id"], name: "index_villages_on_count_id"
    t.index ["desc"], name: "index_villages_on_desc"
    t.index ["district"], name: "index_villages_on_district"
    t.index ["lh"], name: "index_villages_on_lh"
    t.index ["name"], name: "index_villages_on_name"
    t.index ["rj"], name: "index_villages_on_rj"
    t.index ["tcw"], name: "index_villages_on_tcw"
    t.index ["type_id"], name: "index_villages_on_type_id"
    t.index ["v_id"], name: "index_villages_on_v_id"
    t.index ["wy"], name: "index_villages_on_wy"
    t.index ["wy_price"], name: "index_villages_on_wy_price"
  end

  add_foreign_key "houses", "villages"
  add_foreign_key "positions", "villages"
  add_foreign_key "properties", "villages"
  add_foreign_key "village_prices", "villages"
end
