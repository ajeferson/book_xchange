# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161002162026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.integer "badge_id"
    t.string  "user_username", null: false
  end

  add_index "achievements", ["badge_id"], name: "index_achievements_on_badge_id", using: :btree
  add_index "achievements", ["user_username"], name: "index_achievements_on_user_username", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string  "number",     null: false
    t.string  "complement"
    t.string  "cep",        null: false
    t.integer "street_id"
  end

  add_index "addresses", ["street_id"], name: "index_addresses_on_street_id", using: :btree

  create_table "authors", primary_key: "cpf", force: :cascade do |t|
    t.string "name",       null: false
    t.date   "birth_date"
  end

  create_table "badges", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "books", primary_key: "isbn", force: :cascade do |t|
    t.integer "pages",          null: false
    t.string  "name",           null: false
    t.date    "publish_date",   null: false
    t.integer "edition",        null: false
    t.string  "publisher_cnpj"
    t.integer "genre_id"
    t.string  "author_cpf"
  end

  add_index "books", ["author_cpf"], name: "index_books_on_author_cpf", using: :btree
  add_index "books", ["genre_id"], name: "index_books_on_genre_id", using: :btree
  add_index "books", ["publisher_cnpj"], name: "index_books_on_publisher_cnpj", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string  "name",     null: false
    t.integer "state_id"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "countries", primary_key: "name", force: :cascade do |t|
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "points",        null: false
    t.string  "comment"
    t.string  "user_username", null: false
    t.string  "book_isbn",     null: false
  end

  create_table "exchanges", force: :cascade do |t|
    t.date   "date",            null: false
    t.string "user_a_username"
    t.string "user_b_username"
    t.string "book_a_isbn",     null: false
    t.string "book_b_isbn",     null: false
  end

  add_index "exchanges", ["book_a_isbn"], name: "index_exchanges_on_book_a_isbn", using: :btree
  add_index "exchanges", ["book_b_isbn"], name: "index_exchanges_on_book_b_isbn", using: :btree
  add_index "exchanges", ["user_a_username"], name: "index_exchanges_on_user_a_username", using: :btree
  add_index "exchanges", ["user_b_username"], name: "index_exchanges_on_user_b_username", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "body",               null: false
    t.datetime "date",               null: false
    t.string   "addressee_username", null: false
    t.string   "sender_username",    null: false
  end

  add_index "messages", ["addressee_username"], name: "index_messages_on_addressee_username", using: :btree
  add_index "messages", ["sender_username"], name: "index_messages_on_sender_username", using: :btree

  create_table "neighborhoods", force: :cascade do |t|
    t.string  "name",    null: false
    t.integer "city_id"
  end

  add_index "neighborhoods", ["city_id"], name: "index_neighborhoods_on_city_id", using: :btree

  create_table "publishers", primary_key: "cnpj", force: :cascade do |t|
    t.string  "name",       null: false
    t.integer "address_id"
  end

  add_index "publishers", ["address_id"], name: "index_publishers_on_address_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string "name",         null: false
    t.string "country_name", null: false
  end

  add_index "states", ["country_name"], name: "index_states_on_country_name", using: :btree

  create_table "streets", force: :cascade do |t|
    t.string  "name",            null: false
    t.string  "kind",            null: false
    t.integer "neighborhood_id"
  end

  add_index "streets", ["neighborhood_id"], name: "index_streets_on_neighborhood_id", using: :btree

  create_table "telephones", primary_key: "number", force: :cascade do |t|
    t.string "publisher_cnpj", null: false
  end

  add_index "telephones", ["publisher_cnpj"], name: "index_telephones_on_publisher_cnpj", using: :btree

  create_table "users", primary_key: "username", force: :cascade do |t|
    t.string "name",       null: false
    t.string "email",      null: false
    t.string "password",   null: false
    t.date   "birth_date"
  end

  add_foreign_key "achievements", "badges"
  add_foreign_key "achievements", "users", column: "user_username", primary_key: "username"
  add_foreign_key "addresses", "streets"
  add_foreign_key "books", "authors", column: "author_cpf", primary_key: "cpf"
  add_foreign_key "books", "genres"
  add_foreign_key "books", "publishers", column: "publisher_cnpj", primary_key: "cnpj"
  add_foreign_key "cities", "states"
  add_foreign_key "evaluations", "books", column: "book_isbn", primary_key: "isbn"
  add_foreign_key "evaluations", "users", column: "user_username", primary_key: "username"
  add_foreign_key "exchanges", "books", column: "book_a_isbn", primary_key: "isbn"
  add_foreign_key "exchanges", "books", column: "book_b_isbn", primary_key: "isbn"
  add_foreign_key "exchanges", "users", column: "user_a_username", primary_key: "username"
  add_foreign_key "exchanges", "users", column: "user_b_username", primary_key: "username"
  add_foreign_key "messages", "users", column: "addressee_username", primary_key: "username"
  add_foreign_key "messages", "users", column: "sender_username", primary_key: "username"
  add_foreign_key "neighborhoods", "cities"
  add_foreign_key "publishers", "addresses"
  add_foreign_key "states", "countries", column: "country_name", primary_key: "name"
  add_foreign_key "streets", "neighborhoods"
  add_foreign_key "telephones", "publishers", column: "publisher_cnpj", primary_key: "cnpj"
end
