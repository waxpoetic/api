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

ActiveRecord::Schema.define(version: 20170509225149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "artists", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.string   "bio"
    t.string   "photo_uid"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "youtube_playlist_id"
    t.string   "starting_youtube_video_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "facebook_url"
    t.string   "tickets_url"
    t.datetime "starts_at"
    t.datetime "open_at"
    t.uuid     "artist_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["artist_id"], name: "index_events_on_artist_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.integer  "position"
    t.string   "purpose"
    t.string   "file_uid"
    t.string   "file_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["file_uid"], name: "index_images_on_file_uid", using: :btree
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree
    t.index ["position"], name: "index_images_on_position", using: :btree
    t.index ["purpose"], name: "index_images_on_purpose", using: :btree
  end

  create_table "releases", force: :cascade do |t|
    t.string   "name"
    t.uuid     "artist_id",      null: false
    t.string   "description"
    t.string   "catalog_number"
    t.string   "cover_uid"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["artist_id"], name: "index_releases_on_artist_id", using: :btree
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "release_id"
    t.string   "preview_uid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["release_id"], name: "index_tracks_on_release_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["name"], name: "index_users_on_name", using: :btree
    t.index ["password_digest"], name: "index_users_on_password_digest", using: :btree
  end

  add_foreign_key "articles", "users"
  add_foreign_key "tracks", "releases"
end
