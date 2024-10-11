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

ActiveRecord::Schema.define(version: 2024_10_11_222807) do

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "genero"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movie_categories", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_movie_categories_on_category_id"
    t.index ["movie_id"], name: "index_movie_categories_on_movie_id"
  end

  create_table "movies", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "titulo"
    t.time "fecha_lanzamiento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sumaries", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.text "sinopsis"
    t.string "critica"
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_sumaries_on_movie_id"
  end

  add_foreign_key "movie_categories", "categories"
  add_foreign_key "movie_categories", "movies"
  add_foreign_key "sumaries", "movies"
end
