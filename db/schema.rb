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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160407172750) do
=======
ActiveRecord::Schema.define(version: 20160407160437) do
>>>>>>> be3045e... Include gems for bcrypt and avatar - create user model and migration with validations

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 0608922... Including gem file and assets folder in commit. Missed on last commit
=======
>>>>>>> 14963a2... Commit before merge
  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "reviewer_id", null: false
    t.integer  "toilet_id",   null: false
    t.string   "review_text", null: false
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["reviewer_id"], name: "index_reviews_on_reviewer_id", using: :btree
  add_index "reviews", ["toilet_id"], name: "index_reviews_on_toilet_id", using: :btree

  create_table "toilets", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "location",    null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

<<<<<<< HEAD
  create_table "users", force: :cascade do |t|
    t.string   "username",          null: false
    t.string   "password_digest",   null: false
    t.string   "email",             null: false
    t.string   "first_name",        null: false
    t.string   "last_name",         null: false
    t.integer  "zip_code",          null: false
    t.string   "gender",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
<<<<<<< HEAD
  end

<<<<<<< HEAD
=======
  create_table "users", force: :cascade do |t|
    t.string   "username",          null: false
    t.string   "password_digest",   null: false
    t.string   "email",             null: false
    t.string   "first_name",        null: false
    t.string   "last_name",         null: false
    t.integer  "zip_code",          null: false
    t.string   "gender",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
=======
>>>>>>> 14963a2... Commit before merge
  end

  add_index "users", ["password_digest"], name: "index_users_on_password_digest", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

<<<<<<< HEAD
>>>>>>> be3045e... Include gems for bcrypt and avatar - create user model and migration with validations
=======
  add_index "users", ["password_digest"], name: "index_users_on_password_digest", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

>>>>>>> 0608922... Including gem file and assets folder in commit. Missed on last commit
=======
>>>>>>> 14963a2... Commit before merge
=======
>>>>>>> d4e4875... add users controller
end
